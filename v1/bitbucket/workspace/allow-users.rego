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
        user_list := get_valid_user_list(workspace_key)
        some user in user_list
        not match_any(user.result_object.username)
		r = {
			"user": user.result_object.username,
			"permission": user.result_object.permission
		}
	}
}

get_valid_user_list(workspace_key) = { user |
    is_cloud(input.evidence.predicate.environment.labels)
    some user in input.evidence.predicate.content[workspace_key].workspace_user
}{
    is_cloud(input.evidence.predicate.environment.labels)
}

get_valid_user_list(workspace_key) = {user |
    not is_cloud(input.evidence.predicate.environment.labels)
    some user in input.evidence.predicate.content[workspace_key].global_user
}{
      not is_cloud(input.evidence.predicate.environment.labels)
}

is_cloud(labels) {
    some label in labels
    label == "platform_instance=bitbucket_cloud"
}
match_any(required_name) {
    allowed_user_list := input.config.args.allowed_users
	some allowed_user in allowed_user_list
	allowed_user == required_name
}

