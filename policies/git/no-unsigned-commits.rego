package verify

import future.keywords.if

default allow = false

default violations = []

default signature := ""

default msg := "Some commits are unsigned"

verify = v if {
	v := {
		"allow": allow,
		"violation": {"details": violations},
		"summary": [{
			"allow": allow,
			"reason": msg,
			"details": json.marshal(violations),
			"violations": count(violations),
		}],
	}
}

allow if {
	count(violations) == 0
}

msg = "All commits are signed" if allow

violations = j if {
	j := {r |
		some i, k
		components := input.evidence.predicate.bom.components
		comp := components[i]
		prop := comp.properties[k]
		prop.name == "PGPSignature"
		prop.value == ""
		r = {"component": comp.name}
	}
}
