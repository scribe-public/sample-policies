package verify

import future.keywords.in
import data.scribe as scribe

default allow := false
default violations := []
default exiring_in_days := 30
default asset := {}

asset := scribe.get_asset_data(input.evidence)

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "admins",
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
        bad_token(token)
        r = {
            "token": token.name,
			"expires_at": token.result_object.expires_at,
        }
	}
}

parse_time(time_str) = v {
	v := time.parse_rfc3339_ns(time_str)
}

parse_time(time_str) = v {
	time_str2 =  concat("", [time_str, "T00:00:00.000Z"])
	v := time.parse_rfc3339_ns(time_str2)
}

bad_token(token) {
	token.result_object.expires_at
	expires_at := parse_time(token.result_object.expires_at)
	expires_at >= time.now_ns() + max_expiring
}

bad_token(token) {
	not token.result_object.expires_at
}
