package verify

import future.keywords.in

default allow = false

default violations = []

default b = ""

default msg := "Not all required packages are present in the SBOM"

verify = v {
	v := {
		"allow": allow,
		"violations": violations,
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

msg = "Enough required packages are present in the SBOM" {
	allow
}

violations = j {
	j := {r |
		some k
		b := input.config.args.required_pkgs[k]
		not any_match(b)
		r := {
			"type": "missing required package",
			"package": b,
		}
	}
}

any_match(b) {
	some component in input.evidence.predicate.bom.components
	p := component.purl
	contains(p, b)
}
