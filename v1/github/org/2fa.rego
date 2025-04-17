package verify

import future.keywords.in

default allow := false

default violations := []

# default exception := false

exception := input.config.args.exception

default desired_value := true

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
	not exception
	count(violations) == 0
}

allow {
	exception
}

reason = v {
	not exception
	allow
	v := "2FA authentication is enabled"
}

reason = v {
	not exception
	not allow
	v := "2FA authentication is NOT enabled"
}

reason = v {
	exception
	v := "The rule is set to exception"
}

violations = j {
	j := [r |

		project := input.evidence.predicate.content[_]
        organization := project.organization
        organization_details := organization.result_object.organization_details

        organization_details.two_factor_requirement_enabled != desired_value

		r := {
            "scribe_type": organization.scribe_type,
            "name": organization.name,
			"id": organization.id,
			"query_id": organization.query_id,
            "organization_details": organization_details,
			"exception": exception,
        }
	]
}

