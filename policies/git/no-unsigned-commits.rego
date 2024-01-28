package verify

import future.keywords.if

default allow = false

default violations = []

default signature := ""

verify = v if {
	v := {
		"allow": allow,
		"violation": {
			"type": "Unsigned Commits",
			"details": violations,
		},
		"summary": [{
			"allow": allow,
			"reason": reason,
			"violations": count(violations),
		}],
	}
}

allow if {
	count(violations) == 0
}

reason = v {
	allow
	v := "all commits are signed"
}

reason = v {
	not allow
	v := "some commits are unsigned"
}

violations = j if {
	j := {r |
		some i, k
		components := input.evidence.predicate.bom.components
		comp := components[i]
		prop := comp.properties[k]
		prop.name == "PGPSignature"
		prop.value == ""
		r = {"commit": comp.name}
	}
}
