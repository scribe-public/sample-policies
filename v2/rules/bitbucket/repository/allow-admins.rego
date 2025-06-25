package verify

import future.keywords.in

default allow := false
default violations := []
default is_cloud := false


verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "Not allowed admins",
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
	v := "All the admins are from the allowed list"
}

reason = v {
	not allow
	v := "Some admins are not from the allowed list"
}

violations = j {
	j := {r |
		repo_key := input.evidence.predicate.content.metadata.repository_list[_]
        user_list := get_valid_user_list(repo_key)
        some user in user_list
        not match_any(user.result_object.username)
		r = {
			"user": user.result_object.username,
			"permission": user.result_object.permission
		}
	}
}

get_valid_user_list(repo_key) := v {
    is_cloud
    v := [
        user |
        some user in input.evidence.predicate.content[repo_key].repository_user
        user.result_object.permission == "admin"
    ]
}

get_valid_user_list(repo_key) := v {
    not is_cloud
    v := [
        user |
        some user in input.evidence.predicate.content[repo_key].repository_user
        user.result_object.permission == "REPO_ADMIN"
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
