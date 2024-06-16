package verify

import future.keywords.in

default allow := false

default violations := []

default white_listed_namespace := []

white_listed_namespace = input.config.args.white_listed_namespace {
	input.config.args.white_listed_namespace
} 

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "A rule to verify that all namespace are allowed",
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
	v := "All namespace are allowed"
}

reason = v {
	not allow
	v := "There is at least one namespace that is not allowed"
}



# j is now a list in order to make sure duplications are not lost

violations = j {
	j := [r |

		projects := object.remove(input.evidence.predicate.content, {"metadata"})
		
		project := projects[_]
		namespace := project.namespace
		
		not is_valid(namespace)

		r := {
			"scribe_type": namespace.scribe_type,
            "name": namespace.name,
			"id": namespace.id,
			"query_id": namespace.query_id,
			"white_listed_namespace": white_listed_namespace,
        }
	]
}

is_valid(namespace) {
	count(white_listed_namespace) > 0
	name := namespace.name
	some pattern in white_listed_namespace
	regex.match(pattern, name)
}
