package verify

import future.keywords.in


default allow := false
default violations := []
default disable_overriding_approvers_per_merge_request := false


disable_overriding_approvers_per_merge_request := input.config.args.disable_overriding_approvers_per_merge_request 

verify = v {
    v := {
        "allow": allow,
        "violation": {
            "type": "Misconfiguration",
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
    v := "All binary fields: 'disable_overriding_approvers_per_merge_request' are properly set "
}

reason = v {
    not allow
    v := "At least one of the binary fields: 'disable_overriding_approvers_per_merge_request' are not properly set"
}

violations := [r |

    project := input.evidence.predicate.content[_]

    disable_overriding_approvers_per_merge_request != project.project.result_object.approval_settings.disable_overriding_approvers_per_merge_request

    r := {
        "scribe_type": project.project.scribe_type,
        "name": project.project.name,
        "id": project.project.id,
        "disable_overriding_approvers_per_merge_request": project.project.result_object.approval_settings.disable_overriding_approvers_per_merge_request,
        "desired_disable_overriding_approvers_per_merge_request": disable_overriding_approvers_per_merge_request,
    }
]
