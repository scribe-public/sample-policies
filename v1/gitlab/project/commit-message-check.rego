package verify

import future.keywords.in

default allow := false

default violations := []

default commit_message_regex := ".*"

commit_message_regex = input.config.args.commit_message_regex {
	input.config.args.commit_message_regex != ""
}

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "admins",
			"details": violations,
		},
		"summary": [{
			"allow": allow,
			"reason": reason,
			"violations": count(violations),
		}],
	}
}

allow {
	count(violations) == 0
}

reason = v {
	allow
	v := "all commits meet the commit message regex"
}

reason = v {
	not allow
	v := "some commits do not meet the commit message regex"
}

violations = j {
	j := {r |
        some commit in input.evidence.predicate.content[_].commit
		not commit_message_match(commit)
        r = {
			"commit": commit.id,
			"title": commit.result_object.title,
			"message": commit.result_object.message,
        }
	}
}

commit_message_match(commit) {
    regex.match(commit_message_regex, commit.result_object.title)
}

commit_message_match(commit) {
    regex.match(commit_message_regex, commit.result_object.message)
}

