package verify

import future.keywords.in
import time

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
    v := "All tokens are not expired"
}

reason = v {
    not allow
    v := "At least one token is expired"
}

violations := {r |
    
    some token in object.remove(input.content, "metadata")
    token_obj.token.result_object.is_active == false 
    r := {
        "id": token_obj.token.id
        "name": token_obj.token.name
        "result_object": {
            "is_active": false
            "last_used": token_obj.token.result_object.last_used
        }
    }
}
