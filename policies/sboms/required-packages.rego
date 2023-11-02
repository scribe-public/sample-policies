package verify

import future.keywords.in

default allow = false

default violations = []

default b = ""

default msg := "Not all required packages are present in the SBOM"

short_description = "Verify that all required packages are present in the SBOM"

description = "This policy verifies that all required packages are present in the SBOM. It takes list of required packages and allowed number of violations as an input and fails if the number of missing packages exceeds this limit."

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "Required Package not included in SBOM",
			"details": violations,
		},
		"short_description": short_description,
		"description": description,
		"summary": [{
			"allow": allow,
			"reason": msg,
			"violations": count(violations),
			"details": json.marshal(violations),
		}],
	}
}

allow {
	count(violations) <= input.config.args.violations_limit
}

msg = v {
	allow
	v := sprintf("Enough required packages are present in the SBOM.\n Found %d violations under max violation limit %d", [count(violations), input.config.args.violations_limit])
}

msg = v {
	not allow
	v := sprintf("Not all required packages are present in the SBOM.\n Found %v violations exceeds max violation limit %v.", [count(violations), input.config.args.violations_limit])
}


violations = j {
	j := {r |
		some k
		b := input.config.args.required_pkgs[k]
		not any_match(b)
		r := {"package": b}
	}
}

any_match(b) {
	some component in input.evidence.predicate.bom.components
	p := component.purl
	contains(p, b)
}
