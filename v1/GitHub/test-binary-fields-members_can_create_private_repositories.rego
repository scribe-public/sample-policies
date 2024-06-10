package verify

import future.keywords.in

default allow := false

default violations := []

default desired_value := false

desired_value {
    input.config.args.desired_value
} 


verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "A rule to verify that the binary field: members_can_create_private_repositories is properly set",
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
	v := "All values of the binary field are properly set"
}

reason = v {
	not allow
	v := "There is at least one value of a binary field that is not properly set"
}



# j is now a list in order to make sure duplications are not lost

violations = j {
	j := [r |

		projects := object.remove(input.evidence.predicate.content, {"metadata"})
        project := projects[_]
        organization := project.organization
        organization_details := organization.result_object.organization_details
        # r := organization_details

        organization_details.members_can_create_private_repositories != desired_value

		r := {
            "scribe_type": organization.scribe_type,
            "name": organization.name,
			"id": organization.name,
			"query_id": organization.query_id,
            "organization_details": organization_details,
            "desired_value": desired_value,
            "tested_binary_field": "members_can_create_private_repositories",
        }
	]
}


