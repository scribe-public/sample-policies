package verify

import future.keywords.in

default allow = false
default violations = []
default package_types = []


package_types = input.config.args.types {
	input.config.args.types
}

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "Not Allowed Packages",
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
	count(violations) <= 0
}

reason = v {
	allow
	v := "All packages in the SBOM are on the allowlist"
}

reason = v {
	not allow
	v := "Several packages in the SBOM are *not* on the allowlist"
}

violations = j {
	j := {r |
		some component in input.evidence.predicate.bom.components
		verify_type(component.type)
		not component.purl in input.config.args.allowlist
		r = {"package": component.purl}
	}
}

verify_type(t) {
	count(package_types) <= 0
}

verify_type(t) {
	count(package_types) > 0
	t in input.config.args.types
}
