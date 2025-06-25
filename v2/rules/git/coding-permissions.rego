package verify

import future.keywords.in

default allow := false
default violations := []
default props := []
default author := ""

short_description = "Check if all commits were made by authorized authors"

description = "This rule checks if all commits in the specified repo are made by authorized authors. It takes a list of authors and a list of files to be checked as an input and issues an error if any commit to specified files was made by anyone not matching the authors list."


verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "Coding Permissions Violation",
			"details": violations,
		},
		"short_description": short_description,
		"description": description,
		"summary": [{
			"allow": allow,
			"reason": reason,
			"violations": count(violations),
		}],
	}
}

reason = v {
	allow
	v := "All commits to monitored files were made by authorized authors"
}

reason = v {
	not allow
	v := "Commits to monitored files were made by unauthorized authors "
}

allow {
	count(violations) == 0
}

violations = j {
	j := {r |
		some file in input.config.args.files
		some object in input.evidence.predicate.bom.components
		object.type == "file"
		object.name == file
		some prop in object.properties
		prop.name == "last_commit"
		author := get_commit_author(prop.value)
		not any_match(author)
		r = {
			"file": file,
			"author": author,
		}
	}
}

any_match(author) {
	some id in input.config.args.ids
	contains(author, id)
}

get_commit_author(hash) := h {
	some object in input.evidence.predicate.bom.components
	object.type == "file"
	object.name == hash
	some prop in object.properties
	prop.name == "Author"
	h := prop.value
}
