package verify

import future.keywords.in

default allow := false

default violations := []

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "Non terminated namespace",
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
	v := "All namespace have been terminated"
}

reason = v {
	not allow
	v := "There is at least one namespace that has not been terminated"
}

violations = j {
	j := [r |

		project := input.evidence.predicate.content[_]
		namespace := project.namespace[_]
		namespace.scribe_type == "namespace"
		container_info := namespace.result_object.container_info[0]

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


# Checks that the namespace has been terminated
is_valid(container_info) {
	container_info.state.terminated != null 
}
