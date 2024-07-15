package verify

import future.keywords.in

default allow := false

default violations := []

default valid_regex_list := []

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
	v := "All fields in security and analysis are correct"
}

reason = v {
	not allow
	v := "There is at least one fields in security and analysis which is not correct"
}

violations = j {
	j := [r |

		project := input.evidence.predicate.content[_]

		ancestors := project.ancestors
		
		# Must make sure that this is the field to be tested
		secret_scanning_validity_checks := ancestors[0].result_object.organization_details.secret_scanning_validity_checks_enabled 

        repository := project.repository

		not check_secret_scanning_validity_checks_enabled(repository, secret_scanning_validity_checks)

		r := {
            "scribe_type": repository.scribe_type,
            "name": repository.name,
			"id": repository.id,
			"query_id": repository.query_id,
			"validity_checks_enabled": secret_scanning_validity_checks,
			"security_and_analysis_status": repository.result_object.security_and_analysis.secret_scanning_validity_checks.status,
        }
	]
}

# Define the function to check secret_scanning status
check_secret_scanning_validity_checks_enabled(repository, secret_scanning_validity_checks) {
    secret_scanning_validity_checks == true
    repository.result_object.security_and_analysis.secret_scanning_validity_checks.status == "enabled"
}

check_secret_scanning_validity_checks_enabled(repository, secret_scanning_validity_checks) {
    secret_scanning_validity_checks == false
    repository.result_object.security_and_analysis.secret_scanning_validity_checks.status == "disabled"
}

