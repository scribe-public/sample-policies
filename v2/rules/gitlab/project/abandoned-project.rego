package verify

import future.keywords.in
import data.scribe as scribe

default allow := false
default violations := []
default inactive_for_days := 30
default asset := {}

asset = scribe.get_asset_data(input.evidence)

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "last_activity",
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

inactive_for_days = input.config.args.inactive_for_days {
    input.config.args.inactive_for_days
}

nanosecs_per_second = (1000 * 1000) * 1000

nanosecs_per_day = ((24 * 60) * 60) * nanosecs_per_second

max_inactive = inactive_for_days * nanosecs_per_day

reason = v {
	v := sprintf("%d violations | %d max inactive days", [count(violations), inactive_for_days])
}

violations = j {
	j := {r |
		project = input.evidence.predicate.content[_].project.result_object
		last_activity = time.parse_rfc3339_ns(project.last_activity)
		time.now_ns() > last_activity + max_inactive
        r = {
            "project": project.name,
			"last_activity": project.last_activity,
        }
	}
}
