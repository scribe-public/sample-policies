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
	count(violations) == 0
}

reason = v {
	allow
	v := "No tokens have scopes that are in the blocklist"
}

reason = v {
	not allow
	v := "Some of the tokens have scopes that are in the blocklist"
}

violations = j {
	j := {r |
        some token in input.evidence.predicate.content[_].token
        token.result_object.revoked == false
        token.result_object.active == true
        some scope in token.result_object.scopes
		match_any(scope)
        r = {
            "token": token.name,
			"scope": scope,
        }
	}
}

match_any(scope) {
    forbidden_scopes_list = input.config.args.project_scopes
	some forbidden_scope in forbidden_scopes_list
	forbidden_scope == scope
}