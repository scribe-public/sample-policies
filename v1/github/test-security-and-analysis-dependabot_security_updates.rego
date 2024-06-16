package verify

import future.keywords.in

default allow := false

default violations := []

default valid_regex_list := []


verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "A rule to verify that dependabot_security_updates in security_and_analysis is properly set",
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

		organization := project.organization
		
		# Must make sure that this is the field to be tested
		dependabot_security_updates := organization.result_object.organization_details.dependabot_security_updates_enabled_for_new_repositories 

        repositories := project.repository
        repository := repositories[_]	

		not check_dependabot_security_updates_enabled_for_new_repositories(repository, dependabot_security_updates)

		r := {
            "scribe_type": repository.scribe_type,
            "name": repository.name,
			"id": repository.name,
			"query_id": repository.query_id,
			"dependabot_security_updates_enabled_for_new_repositories": dependabot_security_updates,
			"security_and_analysis": {
				"status": repository.result_object.security_and_analysis.dependabot_security_updates.status,
			}			
        }
	]
}

# Define the function to check dependabot_security_updates status
check_dependabot_security_updates_enabled_for_new_repositories(repository, dependabot_security_updates) {
    dependabot_security_updates == true
    repository.result_object.security_and_analysis.dependabot_security_updates_enabled_for_new_repositories.status == "enabled"
}

check_dependabot_security_updates_enabled_for_new_repositories(repository, dependabot_security_updates) {
    dependabot_security_updates == false
    repository.result_object.security_and_analysis.dependabot_security_updates_enabled_for_new_repositories.status == "disabled"
}

