package verify

import future.keywords.in

default allow := false
default violations := []


verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "Not allowed users",
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
	v := "All the users are from the allowed list"
}

reason = v {
	not allow
	v := "Some users are not from the allowed list"
}

violations = j {
	j := {r |
        user_list := [val | val := input.evidence.predicate.content[_].user[_].result_object.username]
		some user in user_list
		not match_any(user)
		r = {
			"user": user,
		}
	}
}

match_any(required_name) {
    allowed_user_list := input.config.args.allowed_users
	some allowed_user in allowed_user_list
	allowed_user == required_name
}
