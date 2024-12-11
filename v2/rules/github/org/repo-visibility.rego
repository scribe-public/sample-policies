package verify

import future.keywords.in

default allow := false

default violations := []

default allowed_repo_names := []

default asset := {}

asset = scribe.get_asset_data(input.evidence)


allowed_repo_names = input.config.args.allowed_repo_names {
    input.config.args.allowed_repo_names
} 


verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "Invalid repositories",
			"details": violations,
		},
		"asset": asset,
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

violations = j {
	j := [r |

		project := input.evidence.predicate.content[_]
        repositories := project.repository
        repository := repositories[_]
		repository.result_object.visibility == "public"
		not is_valid(repository)

		r := {
            "scribe_type": repository.scribe_type,
            "name": repository.name,
			"id": repository.id,
			"query_id": repository.query_id,
			"visibility": repository.result_object.visibility,
        }
	]
}

# Must get a better understanding of how to check if a repo is in a list of valid predefined regexes
is_valid(repository) {
	count(allowed_repo_names) > 0
	some pattern in allowed_repo_names
	regex.match(pattern, repository.name)
}

