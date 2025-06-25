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
	v := "All the tokens have scopes only from the allowed list"
}

reason = v {
	not allow
	v := "Some of the tokens have scopes from outside the allowed list"
}

violations = j {
	j := {r |
        some token in input.evidence.predicate.content[_].token
        token.result_object.revoked == false
        token.result_object.active == true
        some scope in token.result_object.scopes
		not match_any(scope)
        r = {
            "token": token.name,
			"scope": scope,
        }
	}
}

match_any(scope) {
    forbidden_scopes_list = input.config.args.allowed_token_scopes
	some forbidden_scope in forbidden_scopes_list
	forbidden_scope == scope
}
