package verify

import future.keywords.in

default allow := false

default violations := []

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "Long running pod",
			"details": violations,
		},
		"summary": [{
			"allow": allow,
			"reason": reason,
			"violations": count(violations),
			"errors": errors
		}],
	}
}

allow {
	count(violations) == 0
}

reason = v {
	allow
	v := "All running pods have been started after threshold date"
}

reason = v {
	not allow
	v := "There is at least one running pods that has been started before the threshold date"
}

nanosecs_per_second = (1000 * 1000) * 1000

nanosecs_per_day = ((24 * 60) * 60) * nanosecs_per_second

maximum_age = input.config.args.max_days * nanosecs_per_day

violations = j {
	j := [r |
		
		pod := input.evidence.predicate.content[_].pod
		pod.scribe_type == "pod"
		container_info := pod.result_object.container_info[0]

		not container_info.state.terminated
		not container_info.state.waiting

		container_info.state.running != null
	
		startedAt_ns := time.parse_rfc3339_ns(container_info.state.running.startedAt)
		exceeding = time.now_ns() - (startedAt_ns + maximum_age)

		exceeding > 0

		r := {
			"name": pod.name,
			"id": pod.id,
			"query_id": pod.query_id,
			"image": container_info.image,
			"imageID": container_info.imageID,
			"container_info.state": container_info.state,
        }
	]
}
