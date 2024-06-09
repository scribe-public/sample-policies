package verify

import future.keywords.in

default allow := false
default violations := []


reset_approvals_on_push := input.config.args.reset_approvals_on_push 

verify = v {
    v := {
        "allow": allow,
        "violation": {
            "type": "Verify that the binary field: 'reset_approvals_on_push' is set correctly",
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
    v := "All binary fields: 'reset_approvals_on_push' are properly set "
}

reason = v {
    not allow
    v := "At least one of the binary fields: 'reset_approvals_on_push' are not properly set"
}



# Violation has been switched here as a list instead of a set
violations := [r |

    project := object.remove(input.evidence.predicate.content, {"metadata"})[_]

    # r := { "s": project.project.result_object.approval_settings.reset_approvals_on_push}
    reset_approvals_on_push != project.project.result_object.approval_settings.reset_approvals_on_push

    r := {
        "scribe_type": project.project.scribe_type,
        "name": project.project.name,
        "id": project.project.id,
        "reset_approvals_on_push": project.project.result_object.approval_settings.reset_approvals_on_push,
        "desired_reset_approvals_on_push": reset_approvals_on_push,
    }
] 

