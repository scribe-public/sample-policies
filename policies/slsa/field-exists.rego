package verify

import future.keywords.in

default allow := false

default violations := []

default filtered := {"result": "couldn't perform scan"}

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "Missing field",
			"description": sprintf("provenance doesn't contain required fields: %s, max error threshold: %d", [violations, input.config.args.violations_threshold]),
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
	count(violations) <= input.config.args.violations_threshold
}

reason = v {
	allow
	v := "provenance contains all required fields"
}

reason = v {
	not allow
	v := "provenance doesn't contain required fields"
}

violations = j {
	j := {r |
		some field in input.config.args.paths
		filtered := json.filter(input.evidence, [field])
		count(filtered) == 0
		r = {
			"path": field,
			"filtered": filtered,
		}
	}
}
