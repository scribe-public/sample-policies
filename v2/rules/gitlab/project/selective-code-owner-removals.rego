package verify

import future.keywords.in
import data.scribe as scribe

default allow := false
default violations := []
default selective_code_owner_removals := false
default asset := {}

asset = scribe.get_asset_data(input.evidence)

selective_code_owner_removals := input.config.args.selective_code_owner_removals 

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
    v := "All binary fields: 'selective_code_owner_removals' are properly set "
}

reason = v {
    not allow
    v := "At least one of the binary fields: 'selective_code_owner_removals' are not properly set"
}

violations := [r |

    project := input.evidence.predicate.content[_]

    selective_code_owner_removals != project.project.result_object.approval_settings.selective_code_owner_removals

    r := {
        "scribe_type": project.project.scribe_type,
        "name": project.project.name,
        "id": project.project.id,
        "selective_code_owner_removals": project.project.result_object.approval_settings.selective_code_owner_removals,
        "desired_selective_code_owner_removals": selective_code_owner_removals,
    }
] 
