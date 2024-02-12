package verify

default allow = false

default violations = []

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "Packages without licenses",
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
	v := "all packages have licenses"
}

reason = v {
	not allow
	v := "not all packages have licenses"
}

violations = j {
	j := {r |
		components := input.evidence.predicate.bom.components
		some i
		comp := components[i]
		comp.licenses != null
		r = {"component": comp.purl}
	}
}
