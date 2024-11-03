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
	    workspace_key := input.evidence.predicate.content.metadata.workspace_list[_]
        user_list := [
                    val |
                    val := input.evidence.predicate.content[workspace_key].workspace_user[_]
                ]
		some user in user_list
		not match_any(user.result_object.username)
		r = {
			"user": user.result_object.username,
			"permission": user.result_object.permission
		}
	}
}

match_any(required_name) {
    allowed_user_list := input.config.args.allowed_users
	some allowed_user in allowed_user_list
	allowed_user == required_name
}

