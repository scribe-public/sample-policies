package verify

import future.keywords.in

default allow := false
default violations := []


verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "unused users",
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
        startswith(last_activity, "1970-01-01")
        r = {
            "user": user.result_object.name,
			"last_activity": last_activity,
        }
	}
}
