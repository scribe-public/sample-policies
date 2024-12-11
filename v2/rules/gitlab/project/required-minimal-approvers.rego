package verify

import future.keywords.in

default allow := false
default violations := []

default asset := {}

asset = scribe.get_asset_data(input.evidence)

verify = v {
    v := {
        "allow": allow,
        "violation": {
            "type": "Approvers",
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
    v := "All required number of approvers were reached"
}

reason = v {
    not allow
    v := "At least one required number of approvers was not reached"
}

violations := [r | 

    project := input.evidence.predicate.content[_]
        
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
