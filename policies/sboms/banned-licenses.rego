package verify

default allow = false

default violations = []

default msg := "Some packages use blocklisted licenses"

short_description = "Verify if there are no packages with banned licenses in the image"

description = "This policy verifies that there are no packages with banned licenses in the image. It takes list of banned licenses and allowed number of violations as an input and fails if the number of packages that have banned licenses exceeds this limit."

verify = v {
	v := {
		"allow": allow,
		"violation": {"details": violations},
		"short_description": short_description,
		"description": description,
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
