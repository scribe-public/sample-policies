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
		# d := base64.decode(input.evidence.predicate.content)
		# report := json.unmarshal(d)
        some i, j
        level := input.evidence.predicate.content.runs[i].results[j].level
        level == "error"
        res := result(i, j)
        res != "pass"
		r := {
			"level": level,
            "result": res,
		}
	}
}

result(i, j) := r {
    result := input.evidence.predicate.content.runs[i].results[j].kind
    r = result
}

result(i, j) := r {
    not input.evidence.predicate.content.runs[i].results[j].kind
    r = "fail"
}
