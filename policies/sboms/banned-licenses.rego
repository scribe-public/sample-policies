package verify

default allow = false

default violations = []

short_description = "Verify if there are no packages with banned licenses in the image"

description = "This policy verifies that there are no packages with banned licenses in the image. It takes list of banned licenses and allowed number of violations as an input and fails if the number of packages that have banned licenses exceeds this limit."

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "Banned Licenses",
			"details": violations,
		},
		"short_description": short_description,
		"description": description,
		"summary": [{
			"allow": allow,
			"reason": reason,
			"violations": count(violations),
		}],
	}
}

reason = v {
	allow
	v := sprintf("# of packages using banned licenses (%d) does not exceed max violation limit (%d)", [count(violations), input.config.args.blocklisted_limit])
}

reason = v {
	not allow
	v := sprintf("# of packages using banned licenses (%d) exceeds max violation limit (%d)", [count(violations), input.config.args.blocklisted_limit])
}

allow {
	count(violations) <= input.config.args.blocklisted_limit
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
