package verify

import future.keywords.in

default allow := false

default violations := []

default white_listed_pod := []

default verify_namespaces := [".*"]

white_listed_pod = input.config.args.white_listed_pod {
	input.config.args.white_listed_pod != null
	input.config.args.white_listed_pod != []
}

verify_namespaces = input.config.args.verify_namespaces {
	input.config.args.verify_namespaces != null
	input.config.args.verify_namespaces != []
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
		"errors": errors,
	}
}

errors[msg] {
	input.evidence.predicate == null
	msg := "Predicate is missing"
}

errors[msg] {
	input.evidence.predicate.content == null
	msg := "Content is missing"
}

errors[msg] {
	not is_valid_input(white_listed_pod)
	msg := "white_listed_pod is required"
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
	v := sprintf("%d violations | 0 max allowed", [count(violations)])
}



# j is now a list in order to make sure duplications are not lost

violations = j {
	j := [r |

		project := input.evidence.predicate.content[_]
		
		namespace_match(project.namespace, verify_namespaces)

		pod := project.pod[_]
		
		not is_valid(pod)

		r := {
			"name": pod.name,
			"id": pod.id,
			"query_id": pod.query_id,
    }
	]
}

namespace_match(namespace, verify_namespaces) {
    some namespace_regex in verify_namespaces
    regex.match(namespace_regex, namespace.name)
}

is_valid(pod) {
	count(white_listed_pod) > 0
	name := pod.name
	some pattern in white_listed_pod
	regex.match(pattern, name)
}

is_valid_input(i){
	i != null
	i != []
}