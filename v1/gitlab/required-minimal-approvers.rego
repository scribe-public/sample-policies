package verify

import future.keywords.in

default allow := false
default violations := []


verify = v {
    v := {
        "allow": allow,
        "violation": {
            "type": "Verify that the number of approvers is less than the config-number",
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
    v := "All required number of approvers were reached"
}

reason = v {
    not allow
    v := "At least one required number of approvers was not reached"
}

# TODO:
# 1. Test

# Violation has been switched here as a list instead of a set
violations := [r | 


    project := object.remove(input.evidence.predicate.content, {"metadata"})[_]
    # r := {"required_approvals":project.project.result_object.approval_settings.approvers}
        
    approvers := project.project.result_object.approval_settings.approvers
    required_approvals := project.project.result_object.approval_settings.required_approvals
    
    required_approvals > count(approvers)
    r := {
        "scribe_type": project.project.scribe_type,
        "name": project.project.name,
        "id": project.project.id,
        "required_approvals": required_approvals,
        "approvers": approvers,
    }
] 