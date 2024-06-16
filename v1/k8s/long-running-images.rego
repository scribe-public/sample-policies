package verify

import future.keywords.in

default allow := false

default violations := []


verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "A rule to verify that all images have terminated",
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



# j is now a list in order to make sure duplications are not lost

violations = j {
	j := [r |

		projects := object.remove(input.evidence.predicate.content, {"metadata"})
		
		project := projects[_]
		namespace := project.namespace[_]
		container_info := namespace.result_object.container_info[0]
		not is_valid(container_info)

		image := container_info.image
		r := {
            "name": namespace.name,
			"id": namespace.id,
			"query_id": namespace.query_id,
			"image": image,
            "is_invalid_image": true,
			"has_terminated": false,
			"startedAt": container_info.state.running.startedAt
        }
	]
}


# Only checks if it terminated, doesnt check if it ran for a long time.
is_valid(container_info) {
	container_info.lastState != null
	container_info.lastState
	
	lastState := container_info.lastState 

	lastState.terminated != null
	lastState.terminated
}
