package verify

import future.keywords.in

default allow := false

default violations := []

default inactive_for_days := 1

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

inactive_for_days = input.config.args.inactive_for_days {
    input.config.args.inactive_for_days
}

nanosecs_per_second = (1000 * 1000) * 1000

nanosecs_per_day = ((24 * 60) * 60) * nanosecs_per_second

max_unused = inactive_for_days * nanosecs_per_day

reason = v {
	v := sprintf("%d violations | %d max allowed unused days", [count(violations), inactive_for_days])
}

violations = j {
	j := {r |
        some project in input.evidence.predicate.content[_].project
        last_used := time.parse_rfc3339_ns(project.result_object.last_activity)
        time.now_ns() >= last_used + max_unused
        r = {
            "project": project.name,
			"last_activity": project.result_object.last_activity,
        }
	}
}