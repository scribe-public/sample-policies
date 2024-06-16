package verify

import future.keywords.in

default allow := false

default violations := []

default allowed_repo_names := []


allowed_repo_names = input.config.args.allowed_repo_names {
    input.config.args.allowed_repo_names
} 


verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "A rule to verify that all public repos are in the predefined list",
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
        repository := project.repository
		repository.result_object.visibility == "public"
		not is_valid(repository)

		r := {
            "scribe_type": repository.scribe_type,
            "name": repository.name,
			"id": repository.id,
			"query_id": repository.query_id,
			"visibility": repository.result_object.visibility,
			"allowed_repo_names": allowed_repo_names,
            # "result_object": repository.result_object,
			
        }
	]
}

# Must get a better understanding of how to check if a repo is in a list of valid predefined regexes
is_valid(repository) {
	count(allowed_repo_names) > 0
	some pattern in allowed_repo_names
	regex.match(pattern, repository.name)
}