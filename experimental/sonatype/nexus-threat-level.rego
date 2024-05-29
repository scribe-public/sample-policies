package verify
import future.keywords

default allow := false

default violations := []

report := input.evidence.predicate.content["policyEvaluationResult"]

short_description = "Disallowed Nexus policy violations by threat level"

description = "Verify no violations above specified Threat Level Nexus policies"



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
    v := sprintf("%d violations | 0 max allowed", [count(violations)])
}

allow {
    count(violations) == 0
}

violations := threat_level_violations

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
