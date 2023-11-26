package verify

import future.keywords.in

default allow = false

default violations = []

default b = ""

short_description = "Verify that all required packages are present in the SBOM"

description = "This policy verifies that all required packages are present in the SBOM. It takes list of required packages and allowed number of violations as an input and fails if the number of missing packages exceeds this limit."

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "Required Packages",
			"details": violations,
		},
		"short_description": short_description,
		"description": description,
		"summary": [{
			"allow": allow,
			"reason": reason,
			"violations": count(violations),
			"details": json.marshal(violations),
		}],
	}
}

allow {
	count(violations) <= input.config.args.violations_limit
}

reason = v {
	allow
	v := sprintf("enough required packages are present in the SBOM (found %d violations under max violation limit %d)", [count(violations), input.config.args.violations_limit])
}

reason = v {
	not allow
	v := sprintf("not all required packages are present in the SBOM (found %v violations exceeds max violation limit %v)", [count(violations), input.config.args.violations_limit])
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
