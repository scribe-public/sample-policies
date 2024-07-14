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

# j is now a list in order to make sure duplications are not lost

violations = j {
	j := [r |

		project := input.evidence.predicate.content[_]

		ancestors := project.ancestors
		
		# Must make sure that this is the field to be tested
		dependabot_security_updates := ancestors[0].result_object.organization_details.dependabot_security_updates_enabled_for_new_repositories 

        repository := project.repository

		not check_dependabot_security_updates_enabled_for_new_repositories(repository, dependabot_security_updates)

		r := {
            "scribe_type": repository.scribe_type,
            "name": repository.name,
			"id": repository.id,
			"query_id": repository.query_id,
			"security_updates_enabled": dependabot_security_updates,
			"dependabot_security_updates_status":  {		
				repository.result_object.security_and_analysis.dependabot_security_updates.status,
			}			
    	}
	]
}

# Define the function to check dependabot_security_updates status
check_dependabot_security_updates_enabled_for_new_repositories(repository, dependabot_security_updates) {
    dependabot_security_updates == true
    repository.result_object.security_and_analysis.dependabot_security_updates.status == "enabled"
}

check_dependabot_security_updates_enabled_for_new_repositories(repository, dependabot_security_updates) {
    dependabot_security_updates == false
    repository.result_object.security_and_analysis.dependabot_security_updates.status == "disabled"
}

