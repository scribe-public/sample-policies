package verify

import future.keywords.in
import data.scribe as scribe

default allow := false
default violations := []
default filtered := {"result": "couldn't perform scan"}
default asset := {}

asset = scribe.get_asset_data(input.evidence)

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "Missing field",
			"details": violations,
		},
		"asset": asset,
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
		some field in input.config.args.paths
		parts := split(field, "/")
		object.get(input.evidence, parts, "missing") == "missing"
		r = {
			"path": field,
		}
	}
}
