package verify

import future.keywords.in
import data.scribe as scribe

default allow := false
default violations := []
default desired_value := false
default asset := {}

desired_value {
    input.config.args.desired_value
}

asset = scribe.get_asset_data(input.evidence)

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
	v := "Only allowed users can create repositories in the GitHub organization"
}

reason = v {
	not allow
	v := "Repository creation is not restricted to allowed users"
}

violations = j {
	j := [r |

		project := input.evidence.predicate.content[_]
        organization := project.organization
        organization_details := organization.result_object.organization_details

        organization_details.members_can_create_repositories != desired_value

		r := {
            "scribe_type": organization.scribe_type,
            "name": organization.name,
			"id": organization.id,
			"query_id": organization.query_id,
            "organization_details": organization_details,
        }
	]
}
