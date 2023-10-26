package verify

default allow = false

default violations = []

default msg := "Some packages use blocklisted licenses"

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
	count(violations) < input.config.args.blocklisted_limit
}

msg = "No packages use blocklisted licenses" {
	allow
}

violations = j {
	j := {r |
		components := input.evidence.predicate.bom.components
		some i
		comp := components[i]
		comp.licenses != null
		some j
		l := comp[licenses][j]
		some k
		b := input.config.args.blocklist[k]
		lname := l.license.name
		startswith(lname, b)
		r = {
			"package": comp.purl,
			"license": b,
		}
	}
}
