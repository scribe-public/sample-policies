package verify

import future.keywords.in
import data.scribe as scribe

default allow := false
default violations := []
default asset := {}

asset := scribe.get_asset_data(input.evidence)

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "Disallowed Token Scope",
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
	v := "No tokens have scopes that are in the blocklist"
}

reason = v {
	not allow
	v := "Some tokens have scopes that are in the blocklist"
}

violations = j {
	j := {r |
        some token in input.evidence.predicate.content[_].token
        token.result_object.revoked == false
        token.result_object.active == true
        not token_allowed(token.name)
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

token_allowed(token_name) {
    approved_tokens = input.config.args.approved_tokens
    some t in approved_tokens
    lower(t) == lower(token_name)
}
