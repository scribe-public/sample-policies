package verify

import future.keywords.in

default allow := false

default violations := []

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
	count(violations) <= max_admins()
}

max_admins() = v {
	input.config.args.max_admins
	v := input.config.args.max_admins
}

max_admins() = v {
	not input.config.args.max_admins
	v := 0
}

reason = v {
	v := sprintf("%d admins | %d max allowed", [count(violations), max_admins()])
}

violations = j {
	j := {r |
			some user in input.evidence.predicate.content[_].user
			user.result_object.admin == true
			r = {
			"user": user.result_object.username,
		}
	}
}