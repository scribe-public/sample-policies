package verify

import future.keywords.in

default allow := false
default violations := []

verify = v {
    v := {
        "allow": allow,
        "violation": {
            "type": "token expiration",
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
    v := "No tokens are expired" 
}

reason = v {
    not allow
    v := "At least one token is expired" 
}

violations := {r |
    
    token := input.evidence.predicate.content[_].token

    token_expired(token)
    
    r := {
        "scribe_type": token.scribe_type,
        "id": token.id,
        "name": token.name,
        "result_object": {
            "last_used": token.result_object.last_used,
            "is_active": token.result_object.is_active,
            "scopes": token.result_object.scopes,
        },
    }
}

token_expired(token) {
    token.result_object.is_active == false
}

