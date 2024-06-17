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

		some content in input.evidence.predicate.content
		pod = content.pod
		pod.scribe_type == "pod"
		container_info := pod.result_object.container_info[0]
		not is_valid(container_info)

		image := container_info.image
		r := {
            "name": pod.name,
			"id": pod.id,
			"query_id": pod.query_id,
			"image": image,
			"last_started": container_info.lastState[_].startedAt
        }
	]
}


# Only checks if it terminated, doesnt check if it ran for a long time.
is_valid(container_info) {
	container_info.lastState
	container_info.lastState.terminated 
}


