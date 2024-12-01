package verify

import future.keywords.in

default allow := false

default violations := []

default admins := []

default max_admins := 0

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
	count(admins) <= max_admins
}

max_admins = input.config.args.max_admins {
	input.config.args.max_admins
}

reason = v {
	v := sprintf("%d admins | %d max allowed", [count(admins), max_admins])
}

admins = j {
	j := {r |
			some user in input.evidence.predicate.content[_].user
			user.result_object.admin == true
			r = {
			"user": user.result_object.username,
		}
	}
}

violations = j {
	j := {r |
			count(admins) > max_admins
			r = {"admins": admins}
	}
}