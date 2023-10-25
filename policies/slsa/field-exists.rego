package verify

import future.keywords.in

default msg := "Provenance doesn't contain required fields"

default allow := false

default violations := []

default filtered := {"result": "couldn't perform scan"}

verify = v {
	v := {
		"allow": allow,
		"violations": violations,
		"summary": [{
			"allow": allow,
			"reason": sprintf("%s: %v", [msg, violations]),
			"violations": count(violations),
		}],
	}
}

allow {
	count(violations) <= input.config.args.violations_threshold
}

violations = j {
	j := {r |
		some field in input.config.args.paths
		filtered := json.filter(input.evidence, [field])
		count(filtered) == 0
		r = {
			"type": "missing_path",
			"details": {
				"path": field,
				"filtered": filtered,
			},
		}
	}
}

msg = "Provenance contains all required fields" {
	allow
}
