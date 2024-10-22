package verify

import future.keywords.in
import time

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

violations := {r |
    
    some token in object.remove(input.content, "metadata")
    token_obj.token.result_object.last_used == null 
    r := {
        "id": token_obj.token.id
        "name": token_obj.token.name
        "result_object": {
            "is_active": false
            "last_used": null
        }
    }
}
