package verify

import future.keywords.in

default allow := false
default violations := []


verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "Blocklisted users",
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
	v := "None of the users is from the blocklist"
}

reason = v {
	not allow
	v := "Some of the users are from the blocklist"
}

violations = j {
	j := {r |
        user_list := [val | val := input.evidence.predicate.content[_].user[_].result_object.username]
		some user in user_list
		match_any(user)
		r = {
			"user": user,
		}
	}
}

match_any(user) {
    blockedd_user_list := input.config.args.blocked_users
	some blockedd_user in blockedd_user_list
	blockedd_user == user
}
