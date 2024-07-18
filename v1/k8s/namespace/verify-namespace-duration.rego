package verify

import future.keywords.in

default allow := false

default violations := []

default threshold_date := "2021-01-01T00:00:00Z" # default date

threshold_date := input.config.args.threshold_date {
	valid_input(input.config.args.threshold_date)
}

errors[msg] {
	not valid_input(input.config.args.threshold_date)
	msg := "threshold_date cannot be null nor empty"
}

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "Long running namespace",
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
	v := "All running namespace have been started after threshold date"
}

reason = v {
	not allow
	v := "There is at least one running namespace that has been started before the threshold date"
}

violations = j {
	j := [r |
		
		project := input.evidence.predicate.content[_]
		namespace := project.namespace[_]
		namespace.scribe_type == "namespace"
		container_info := namespace.result_object.container_info[0]

		not container_info.state.terminated  
		not is_valid(container_info)

		r := {
          "name": namespace.name,
			"id": namespace.id,
			"query_id": namespace.query_id,
			"image": container_info.image,
			"imageID": container_info.imageID,
			"container_info.state": container_info.state,
        }
	]
}


# Checks that the running namespace has not been started before the threshold date 
is_valid(container_info) {
	
	container_info.state.running != null
	
	startedAt_ns := time.parse_rfc3339_ns(container_info.state.running.startedAt)
	threshold_ns := time.parse_rfc3339_ns(threshold_date)

	startedAt_ns > threshold_ns	
}

valid_input(x) {
	x != null
	x != ""
}
