package verify
import future.keywords

default allow := false

default violations := []

report := input.evidence.predicate.content["policyEvaluationResult"]

short_description = "Disallowed Nexus policy violations"

description = "Verify no violations of the specified Nexus policies"



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

violations := denied_policies_violations


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
