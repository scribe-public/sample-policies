package verify

import future.keywords.in

default allow := false

default violations := []

default asset := {}

asset = scribe.get_asset_data(input.evidence)

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "Missing Labels",
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
	count(violations) == 0
}

reason = v {
	allow
	v := "gitlab pipeline contains all required labels"
}

reason = v {
	not allow
	v := "gitlab pipeline does not contain all required labels"
}

violations = j {
	j := {r |
		some label in input.config.args.labels
		not match_any(label)
		r = {
			"label": label,
		}
	}
}

match_any(required_label) {
	some key, label in input.evidence.predicate.content[_].namespace.result_object.labels
	key == required_label
}
