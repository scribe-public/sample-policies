package verify

import future.keywords.in

default allow := false

default violations := []

default valid_regex_list := []


verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "A rule to verify that secret_scanning_validity_checks in security_and_analysis is properly set",
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

# j is now a list in order to make sure duplications are not lost

violations = j {
	j := [r |

		projects := object.remove(input.evidence.predicate.content, {"metadata"})
        project := projects[_]

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
			"secret_scanning_validity_checks_enabled": secret_scanning_validity_checks,
			"security_and_analysis": {
				"status": repository.result_object.security_and_analysis.secret_scanning_validity_checks.status,
			}			
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

