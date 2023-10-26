package verify

default allow = false

default violations = []

default msg := "Not all packages have licenses"

verify = v {
	v := {
		"allow": allow,
		"violation": {"details": violations},
		"summary": [{
			"allow": allow,
			"reason": json.marshal(violations),
			"details": msg,
			"violations": count(violations),
		}],
	}
}

allow {
	count(violations) == 0
}

msg = "All packages have licenses" {
	allow
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
