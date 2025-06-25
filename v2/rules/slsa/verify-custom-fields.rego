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
	v := "Provenance document contains all required fields"
}

reason = v {
	not allow
	v := "Provenance document does *not* contain all required fields"
}

violations = j {
	j := {r |
		some path in object.keys(input.config.args.fields)
		value := input.config.args.fields[path]
		tokens := split(path, "/")
		actual_value := object.get(input.evidence, tokens, "doesn't exist")
		value != actual_value
		r = {
			"path": path,
			"required_value": value,
			"actual_value": actual_value,
		}
	}
}
