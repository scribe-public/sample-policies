package verify

import future.keywords.in

default allow := false

default violations := []

default unused_for_days := 1

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "admins",
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

unused_for_days = input.config.args.unused_for_days {
    input.config.args.unused_for_days
}

nanosecs_per_second = (1000 * 1000) * 1000

nanosecs_per_day = ((24 * 60) * 60) * nanosecs_per_second

max_unused = unused_for_days * nanosecs_per_day

reason = v {
	v := sprintf("%d violations | %d max allowed unused days", [count(violations), unused_for_days])
}

violations = j {
	j := {r |
        some token in input.evidence.predicate.content[_].token
        token.result_object.revoked == false
        token.result_object.active == true
        last_used := time.parse_rfc3339_ns(token.result_object.last_used_at)
        time.now_ns() >= last_used + max_unused
        r = {
            "token": token.name,
        }
	}
}