package verify

import future.keywords.in

default allow := false
default violations := []

verify = v {
    v := {
        "allow": allow,
        "violation": {
            "type": "unused tokens",
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
    v := "All tokens have been used" 
}

reason = v {
    not allow
    v := "At least one token has not been used" 
}

violations = j {

    j := {r |
    
        token := input.evidence.predicate.content[_].token

        is_not_used(token)

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
}

is_not_used(token) {
    token.result_object.last_used == null
}
