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

		organization := project.organization
		
		# Must make sure that this is the field to be tested
		secret_scanning := organization.result_object.organization_details.secret_scanning_enabled_for_new_repositories 

        repositories := project.repository
        repository := repositories[_]	

		not check_secret_scanning_enabled_for_new_repositories(repository, secret_scanning)

		r := {
            "scribe_type": repository.scribe_type,
            "name": repository.name,
			"id": repository.id,
			"query_id": repository.query_id,
			"secret_scanning_enabled": secret_scanning,
			"security_and_analysis_status": repository.result_object.security_and_analysis.secret_scanning.status,
        }
	]
}

# Define the function to check secret_scanning status
check_secret_scanning_enabled_for_new_repositories(repository, secret_scanning) {
    secret_scanning == true
    repository.result_object.security_and_analysis.secret_scanning.status == "enabled"
}

check_secret_scanning_enabled_for_new_repositories(repository, secret_scanning) {
    secret_scanning == false
    repository.result_object.security_and_analysis.secret_scanning.status == "disabled"
}
