package verify

import future.keywords.in

default allow := false
default violations := []


verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "Missconfiguration",
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
	v := "Default branch protection is enabled"
}

reason = v {
	not allow
	v := "Default branch protection is not enabled"
}

violations = j {
	j := [r |

		project := input.evidence.predicate.content[_]
        default_branch := project.repository.result_object.default_branch
        branches := project.branch
		branch := branches[_]
        branch.name == default_branch
		not branch.result_object.protection.enabled

		r := {
            "name": branch.name,
			"id": branch.id,
			"protected": branch.result_object.protected,
            "protection_enabled": branch.result_object.protection.enabled,
        }
	]
}
