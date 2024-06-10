package verify

import future.keywords.in

default allow := false

default violations := []

default valid_regex_list := []


valid_regex_list = input.config.args.valid_regex_list {
    input.config.args.valid_regex_list
} 


verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "A rule to verify that secrets are not older than k months",
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
	v := "All public repos are permitted"
}

reason = v {
	not allow
	v := "There is at least one public repo which is not in the predefined list"
}



# j is now a list in order to make sure duplications are not lost

violations = j {
	j := [r |

		projects := object.remove(input.evidence.predicate.content, {"metadata"})
        project := projects[_]
        repositories := project.repository
        repository := repositories[_]
		repository.result_object.visibility == "public"
		not is_valid(repository)

		r := {
            "scribe_type": repository.scribe_type,
            "name": repository.name,
			"id": repository.name,
			"query_id": repository.query_id,
            # "result_object": repository.result_object,
			
        }
	]
}

# Must get a better understanding of how to check if a repo is in a list of valid predefined regexes
is_valid(repository) {
	
	some pattern in valid_regex_list
	regex.match(pattern, repository.name)
}