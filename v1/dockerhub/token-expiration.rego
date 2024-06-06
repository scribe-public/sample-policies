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
    v := "All tokens are not expired" # Edit this
}

reason = v {
    not allow
    v := "At least one token is expired" # Edit this
}

violations := {r |
    some token in object.remove(input.evidence.predicate.content, {"metadata"})
    not token.token.result_object.is_active # Token is expired if is_active == false or the token object does not have is_active under object result
    r := {
        "id": token.token.id,
        "name": token.token.name,
        "result_object": {
            "is_active": false,
            "last_used": token.token.result_object.last_used,
        }
    }
}
