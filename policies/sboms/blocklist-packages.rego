package verify

default allow = false

default violations = []

default msg := "Some blocklisted packages were found in the project"

verify = v {
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

allow {
	count(violations) <= input.config.args.blocklisted_limit
}

msg = "No blocklisted packages were found in the project" {
	allow
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
