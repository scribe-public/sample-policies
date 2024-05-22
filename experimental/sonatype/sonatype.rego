package verify
import future.keywords

default allow := false

default violations := []

report := input.evidence.predicate.content["policyEvaluationResult"]

short_description = "Verify type, level and content of alerts in the report"

description = "Verify type, level and content of alerts in the report"



verify = v {
    v := {
        "allow": allow,
        "violation": {
            "type": "Invalid Report",
            "details": violations 
        },
        "short_description": short_description,
        "description": description,
        "summary": [{
            "allow": allow,
            "reason": reason, 
            "violations": count(violations),
        }],
    }
}

reason = v {
    v := sprintf("%d violations | Denied policies: %v | Minimum threat level: %d | Denied reason substrings: %v", [
        count(violations),
        input.config.args.denied_policies,
        input.config.args.min_threat_level,
        input.config.args.reason_substrings
    ])
}

allow {
    count(violations) == 0
}

tmp := threat_level_violations | denied_policies_violations

violations := tmp | denied_reason_violations

# Function to collect threat level violations
threat_level_violations = v { 
    v := { o |
        some i
        r := report["alerts"][i]
        r["trigger"]["threatLevel"] > input.config.args.min_threat_level
        reason := sprintf("Threat level violation %d", [r["trigger"]["threatLevel"]])
        o := {
            "policy_name": r["trigger"]["policyName"],
            "violation_id": r["trigger"]["policyViolationId"],
            "reason": reason
        }
    }
}

denied_policies_violations = v {
    v := { o |
        some i
        r := report["alerts"][i]
        r["trigger"]["policyName"] in input.config.args.denied_policies
        o := {
            "policy_name": r["trigger"]["policyName"],
            "violation_id": r["trigger"]["policyViolationId"],
            "reason": "Denied policy violation"
        }
    }
}

denied_reason_violations = v {
    v := { o |
        some i,j,k,l
        r := report["alerts"][i]["trigger"]["componentFacts"][j]["constraintFacts"][k]["conditionFacts"][l]
        some m
        contains(r["reason"], input.config.args.reason_substrings[m])
        reason := sprintf("Denied reason violation, reason:%v", [r["reason"]])
        o := {
            "policy_name": report["alerts"][i]["trigger"]["policyName"],
            "violation_id": report["alerts"][i]["trigger"]["policyViolationId"],
            "reason": reason
        }
    }
}
