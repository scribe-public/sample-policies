package verify

import future.keywords.in
import data.scribe as scribe

default allow := false
default violations := []
default is_cloud := false
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
		project_key := input.evidence.predicate.content.metadata.project_list[_]
        user_list := get_valid_user_list(project_key)
        some user in user_list
        not match_any(user.result_object.username)
		r = {
			"user": user.result_object.username,
			"permission": user.result_object.permission
		}
	}
}

get_valid_user_list(project_key) := v {
    is_cloud
    v := [
        user |
        some user in input.evidence.predicate.content[project_key].project_user
        user.result_object.permission == "admin"
    ]
}

get_valid_user_list(project_key) := v {
    not is_cloud
    v := [
        user |
        some user in input.evidence.predicate.content[project_key].project_user
        user.result_object.permission == "PROJECT_ADMIN"
    ]
}

is_cloud {
    some label in input.evidence.predicate.environment.labels
    label == "platform_instance=bitbucket_cloud"
}

match_any(required_name) {
    allowed_user_list := input.config.args.allowed_admins
	some allowed_user in allowed_user_list
	allowed_user == required_name
}
