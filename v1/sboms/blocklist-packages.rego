package verify

default allow = false

default violations = []

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "Blocklisted Packages",
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
	count(violations) <= input.config.args.blocklisted_limit
}

reason = v {
	allow
	v := "no blocklisted packages were found in the project"
}

reason = v {
	not allow
	v := "some blocklisted packages were found in the project"
}

violations = j {
	j := {r |
		components := input.evidence.predicate.bom.components
		some i
		p := components[i].purl
		some k
		b := input.config.args.blocklist[k]
		contains(p, b)
		r = {"package": b}
	}
}
