package verify

import future.keywords.in

default allow := false
default violations := []
default require_password_to_approve := false


require_password_to_approve := input.config.args.require_password_to_approve 

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
    v := "All binary fields: 'require_password_to_approve' are properly set "
}

reason = v {
    not allow
    v := "At least one of the binary fields: 'require_password_to_approve' are not properly set"
}

violations := [r |

    project := input.evidence.predicate.content[_]

    require_password_to_approve != project.project.result_object.approval_settings.require_password_to_approve

    r := {
        "scribe_type": project.project.scribe_type,
        "name": project.project.name,
        "id": project.project.id,
        "require_password_to_approve": project.project.result_object.approval_settings.require_password_to_approve,
        "desired_require_password_to_approve": require_password_to_approve,
    }
]
