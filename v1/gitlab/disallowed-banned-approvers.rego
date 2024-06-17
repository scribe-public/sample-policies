package verify

import future.keywords.in

default allow := false
default violations := []

default banned_list := [] 

banned_list = input.config.args.banned_list {
    input.config.args.banned_list
}

verify = v {
    v := {
        "allow": allow,
        "violation": {
            "type": "Disallowed Approvers",
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
    v := "None of the approvers are on the banned list"
}

reason = v {
    not allow
    v := "At least one approver is on the banned list"
}



# Violation has been switched here as a list instead of a set
violations := [r |

    project := object.remove(input.evidence.predicate.content, {"metadata"})[_]

    required_approvals := project.project.result_object.approval_settings.required_approvals
    approvers := project.project.result_object.approval_settings.approvers

    banned_users_found := banned_users_in_approvers(approvers)

    count(banned_users_found) > 0 
    # r := { "c": banned_users_found}

    r := {
        "scribe_type": project.project.scribe_type,
        "name": project.project.name,
        "id": project.project.id,
        "required_approvals": required_approvals,
        "approvers": approvers,
        "banned_users_found": banned_users_found,
        "banned_list": banned_list,

    }
] 

banned_users_in_approvers(approvers) = result {
    result := { u |
        user := approvers[_]
        user in banned_list
        u := user
    }
}