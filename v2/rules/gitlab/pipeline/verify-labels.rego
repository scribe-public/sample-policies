package verify

import future.keywords.in

default allow := false
default violations := []


verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "Missing Labels",
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
		some label, value in input.config.args.labels
		not match_any(label, value)
		r = {
			"label": label,
			"value": value,
		}
	}
}

match_any(label, value) {
	input.evidence.predicate.content[_].namespace.result_object.labels[label] == value
}
