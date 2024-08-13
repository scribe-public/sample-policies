package verify

import future.keywords.in

default allow := false

default violations := []

default white_listed_pod := []

white_listed_pod = input.config.args.white_listed_pod {
	input.config.args.white_listed_pod
} 

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "A rule to verify that all pod are allowed",
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
	v := "All pod are allowed"
}

reason = v {
	not allow
	v := "There is at least one pod that is not allowed"
}



# j is now a list in order to make sure duplications are not lost

violations = j {
	j := [r |

		projects := object.remove(input.evidence.predicate.content, {"metadata"})
		
		project := projects[_]
		pod := project.pod
		
		not is_valid(pod)

		r := {
			"scribe_type": pod.scribe_type,
            "name": pod.name,
			"id": pod.id,
			"query_id": pod.query_id,
        }
	]
}

is_valid(namespace) {
	count(white_listed_pod) > 0
	name := namespace.name
	some pattern in white_listed_pod
	regex.match(pattern, name)
}
