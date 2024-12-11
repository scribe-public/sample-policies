package verify

import future.keywords.in

default allow := false

default violations := []

default asset := {}

asset = scribe.get_asset_data(input.evidence)

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "Not allowed admins",
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

reason = v {
	allow
	v := "All the admins are from the allowed list"
}

reason = v {
	not allow
	v := "Some admins are not from the allowed list"
}

violations = j {
	j := {r |
        user_list := {val |
			some user in input.evidence.predicate.content[_].user
			user.result_object.admin == true
			val := user.result_object.username
		}
		some user in user_list
		not match_any(user)
		r = {
			"user": user,
		}
	}
}

match_any(required_name) {
    allowed_user_list := input.config.args.allowed_admins
	some allowed_user in allowed_user_list
	allowed_user == required_name
}

