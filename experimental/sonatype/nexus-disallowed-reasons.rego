package verify
import future.keywords

default allow := false

default violations := []

report := input.evidence.predicate.content["policyEvaluationResult"]

short_description = "Disallowed Nexus policy violations by reason"

description = "Verify no violations with the specified reasons in Nexus policies "



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

violations := denied_reason_violations

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
