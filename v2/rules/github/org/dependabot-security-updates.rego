package verify

import future.keywords.in

default allow := false

default violations := []

default desired_value := false

default asset := {}

asset = scribe.get_asset_data(input.evidence)

desired_value {
    input.config.args.desired_value
} 

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "Missconfiguration",
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
	v := "All values of the binary field are properly set"
}

reason = v {
	not allow
	v := "There is at least one value of a binary field that is not properly set"
}

violations = j {
	j := [r |

		project := input.evidence.predicate.content[_]
        organization := project.organization
        organization_details := organization.result_object.organization_details

        organization_details.dependabot_security_updates_enabled_for_new_repositories != desired_value

		r := {
            "scribe_type": organization.scribe_type,
            "name": organization.name,
			"id": organization.id,
			"query_id": organization.query_id,
            "organization_details": organization_details,
        }
	]
}

