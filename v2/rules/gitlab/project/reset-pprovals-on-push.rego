package verify

import future.keywords.in

default allow := false
default violations := []

default asset := {}

asset = scribe.get_asset_data(input.evidence)

reset_approvals_on_push := input.config.args.reset_approvals_on_push 

verify = v {
    v := {
        "allow": allow,
        "violation": {
            "type": "Misconfiguration",
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
    v := "All binary fields: 'reset_approvals_on_push' are properly set "
}

reason = v {
    not allow
    v := "At least one of the binary fields: 'reset_approvals_on_push' are not properly set"
}

violations := [r |

    project := input.evidence.predicate.content[_]

    reset_approvals_on_push != project.project.result_object.approval_settings.reset_approvals_on_push

    r := {
        "scribe_type": project.project.scribe_type,
        "name": project.project.name,
        "id": project.project.id,
        "reset_approvals_on_push": project.project.result_object.approval_settings.reset_approvals_on_push,
        "desired_reset_approvals_on_push": reset_approvals_on_push,
    }
] 
