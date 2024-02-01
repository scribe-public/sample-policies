package verify

import future.keywords.in

import future.keywords.if

default allow := false

default violations := []

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "updates needed",
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
	v := "no packages need updates"
}

reason = v {
	not allow
	v := "some packages need updates"
}

violations = j {
	j := {r |
		input.evidence.predicate.mimeType == "application/json"
        level := input.evidence.predicate.content.runs[_].results[_].level
        level == "error"
		r := {
			"level": level,
		}
	}
}
