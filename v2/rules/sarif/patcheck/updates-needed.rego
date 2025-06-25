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
	v := "None of the dependencies(packages) requires an update"
}

reason = v {
	not allow
	v := "Several dependencies(packages) require an update"
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
