package verify

import future.keywords.in
import time
import data.scribe as scribe

default allow := false
default violations := []
default asset := {}

asset = scribe.get_asset_data(input.evidence)

verify = v {
    v := {
        "allow": allow,
        "violation": {
            "type": "token expiration",
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
