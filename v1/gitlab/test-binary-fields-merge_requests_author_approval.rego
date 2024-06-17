package verify

import future.keywords.in

default allow := false
default violations := []

default merge_requests_author_approval := false

merge_requests_author_approval := input.config.args.merge_requests_author_approval 

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
    v := "All binary fields: 'merge_requests_author_approval' are properly set "
}

reason = v {
    not allow
    v := "At least one of the binary fields: 'merge_requests_author_approval' are not properly set"
}



# Violation has been switched here as a list instead of a set
violations := [r |

    project := object.remove(input.evidence.predicate.content, {"metadata"})[_]

    merge_requests_author_approval != project.project.result_object.approval_settings.merge_requests_author_approval

    r := {
        "scribe_type": project.project.scribe_type,
        "name": project.project.name,
        "id": project.project.id,
        "merge_requests_author_approval": project.project.result_object.approval_settings.merge_requests_author_approval,
        "desired_merge_requests_author_approval": merge_requests_author_approval,
    }
] 

