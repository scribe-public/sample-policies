package verify

import future.keywords.in

default allow := false

default violations := []

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "Non terminated pods",
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
	v := "All pods have been terminated"
}

reason = v {
	not allow
	v := "There is at least one pods that has not been terminated"
}

violations = j {
	j := [r |

		pod := input.evidence.predicate.content[_].pod
		pod.scribe_type == "pod"
		container_info := pod.result_object.container_info[0]

		not is_valid(container_info)

		r := {
            "name": pods.name,
			"id": pods.id,
			"query_id": pods.query_id,
			"image": container_info.image,
			"imageID": container_info.imageID,
			"container_info.state": container_info.state,
        }
	]
}


# Checks that the pods has been terminated
is_valid(container_info) {
	container_info.state.terminated != null 
}
