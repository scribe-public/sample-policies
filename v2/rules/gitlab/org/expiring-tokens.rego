package verify

import future.keywords.in

default allow := false
default violations := []
default exiring_in_days := 30


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

exiring_in_days = input.config.args.exiring_in_days {
    input.config.args.exiring_in_days
}

nanosecs_per_second = (1000 * 1000) * 1000

nanosecs_per_day = ((24 * 60) * 60) * nanosecs_per_second

max_expiring = exiring_in_days * nanosecs_per_day

reason = v {
	v := sprintf("%d violations | %d max days until expire", [count(violations), exiring_in_days])
}

violations = j {
	j := {r |
        some token in input.evidence.predicate.content[_].token
        token.result_object.revoked == false
        token.result_object.active == true
        token.result_object.expires_at
		expires_at := time.parse_rfc3339_ns(token.result_object.expires_at)
		expires_at < time.now_ns() + max_expiring
        r = {
            "token": token.name,
			"expires_at": token.result_object.expires_at,
        }
	}
}
