package verify

import future.keywords.in

default allow := false
default violations := []

default min_number_of_days_since_last_usage = 30

min_number_of_days_since_last_usage := input.config.args.min_number_of_days_since_last_usage {
    input.config.args.min_number_of_days_since_last_usage
    input.config.args.min_number_of_days_since_last_usage >= 0    
}

verify = v {
    v := {
        "allow": allow,
        "violation": {
            "type": "old active token",
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
    v := "No tokens are are old active tokens" 
}

reason = v {
    not allow
    v := "At least one token is an old active token" 
}

violations := {r |
    
    token := input.evidence.predicate.content[_].token
    
    current_time := time.now_ns()
    days_since_last_usage = is_old_active(token, current_time)
    
    r := {
        "scribe_type": token.scribe_type,
        "id": token.id,
        "name": token.name,
        "result_object": {
            "last_used": token.result_object.last_used,
            "is_active": token.result_object.is_active,
            "scopes": token.result_object.scopes,
        },
        "min_number_of_days_since_last_usage": min_number_of_days_since_last_usage,
        "days_since_last_usage": days_since_last_usage,
    }
}

is_old_active(token, current_time) = days_since_last_usage{
    token.result_object.is_active == true
    token.result_object.last_used != null

    last_used_time := time.parse_rfc3339_ns(token.result_object.last_used)
    time_difference := (current_time - last_used_time) / (1000000000 * 60 * 60 * 24)  # Difference in days

    time_difference >= min_number_of_days_since_last_usage

    days_since_last_usage := time_difference 
}

