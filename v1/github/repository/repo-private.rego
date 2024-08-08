package verify

import future.keywords.in

default allow := false

default violations := []

default valid_regex_list := []

desired_value {
    input.config.args.desired_value
} 

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "Missconfiguration",
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
	v := "The repository is private"
}

reason = v {
	not allow
	v := "The repository is not private"
}

# j is now a list in order to make sure duplications are not lost

violations = j {
	j := [r |

		project := input.evidence.predicate.content[_]

		ancestors := project.ancestors
		
        repository := project.repository

		not visibility

		r := {
            "scribe_type": repository.scribe_type,
            "name": repository.name,
			"id": repository.id,
			"query_id": repository.query_id,
			"visibility": visibility
        }
	]
}


# Define the function to check if the repository is private
visibility {
    repository.result_object.visibility == "private"
}
