package verify

import future.keywords.in

default allow := false

default violations := []

default exception := false

exception := {
	input.config.args.exception
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
	not exception
	count(violations) == 0
}

allow {
	exception
}

reason = v {
	not exception
	allow
	v := "The repository is private"
}

reason = v {
	not exception
	not allow
	v := "The repository is not private"
}

reason = v {
	exception
	v := "The rule is set to exception"
}

# j is now a list in order to make sure duplications are not lost

violations = j {
	j := [r |

		project := input.evidence.predicate.content[_]

		ancestors := project.ancestors
		
        repository := project.repository

		not visibility(repository)

		r := {
            "scribe_type": repository.scribe_type,
            "name": repository.name,
			"id": repository.id,
			"query_id": repository.query_id,
			"visibility": repository.result_object.visibility
        }
	]
}


# Define the function to check if the repository is private
visibility(repository) {
    repository.result_object.visibility == "private"
}
