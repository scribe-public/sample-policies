package verify

import future.keywords.in

default allow := false

default violations := []

default inactive_for_days := 30

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "inactive users",
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

inactive_for_days = input.config.args.inactive_for_days {
    input.config.args.inactive_for_days
}

nanosecs_per_second = (1000 * 1000) * 1000

nanosecs_per_day = ((24 * 60) * 60) * nanosecs_per_second

max_unused = inactive_for_days * nanosecs_per_day

adjust_timezone(ts) := adj_ts {
  time.parse_rfc3339_ns(ts)
  adj_ts = ts
}

adjust_timezone(ts) := adj_ts {
  not time.parse_rfc3339_ns(ts)
  adj_ts = concat("", [ts, "Z"])
}

reason = v {
	v := sprintf("%d violations | 0 max allowed", [count(violations)])
}

violations = j {
	j := {r |
        some user in input.evidence.predicate.content.jenkins.user
        last_activity := adjust_timezone(user.result_object.last_activity)
        last_login := time.parse_rfc3339_ns(last_activity)
        time.now_ns() >= last_login + max_unused
        r = {
            "user": user.result_object.name,
			"last_activity": last_activity,
        }
	}
}
