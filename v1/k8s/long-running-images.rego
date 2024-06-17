package verify

import future.keywords.in

default allow := false

default violations := []


verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "Non terminated image",
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
	v := "All images have terminated"
}

reason = v {
	not allow
	v := "There is at least one image that has not terminated"
}

violations = j {
	j := [r |

		project := input.evidence.predicate.content[_]		
		namespace := project.namespace[_]

		container_info := namespace.result_object.container_info[0]
		not is_valid(container_info)

		r := {
            "name": namespace.name,
			"id": namespace.id,
			"query_id": namespace.query_id,
			"image": container_info.image,
			"has_terminated": false,
			"startedAt": container_info.state.running.startedAt
        }
	]
}


# Only checks if it terminated, doesnt check if it ran for a long time.
is_valid(container_info) {
	container_info.lastState
	container_info.lastState.terminated 
}


