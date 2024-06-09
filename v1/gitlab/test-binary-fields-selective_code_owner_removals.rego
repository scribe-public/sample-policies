package verify

import future.keywords.in

default allow := false
default violations := []

default selective_code_owner_removals := false

selective_code_owner_removals := input.config.args.selective_code_owner_removals 

verify = v {
    v := {
        "allow": allow,
        "violation": {
            "type": "Verify that the binary field: 'selective_code_owner_removals' is set correctly",
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
    v := "All binary fields: 'selective_code_owner_removals' are properly set "
}

reason = v {
    not allow
    v := "At least one of the binary fields: 'selective_code_owner_removals' are not properly set"
}



# Violation has been switched here as a list instead of a set
violations := [r |

    project := object.remove(input.evidence.predicate.content, {"metadata"})[_]

    # r := { "s": project.project.result_object.approval_settings.selective_code_owner_removals}
    selective_code_owner_removals != project.project.result_object.approval_settings.selective_code_owner_removals

    r := {
        "scribe_type": project.project.scribe_type,
        "name": project.project.name,
        "id": project.project.id,
        "selective_code_owner_removals": project.project.result_object.approval_settings.selective_code_owner_removals,
        "desired_selective_code_owner_removals": selective_code_owner_removals,
    }
] 

