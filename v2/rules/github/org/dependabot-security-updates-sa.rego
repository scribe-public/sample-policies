package verify

import future.keywords.in

default allow := false

default violations := []

default valid_regex_list := []

default asset := {}

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
		dependabot_security_updates := organization.result_object.organization_details.dependabot_security_updates_enabled_for_new_repositories 

        repositories := project.repository
        repository := repositories[_]	

		not check_dependabot_security_updates_enabled_for_new_repositories(repository, dependabot_security_updates)

		r := {
            "scribe_type": repository.scribe_type,
            "name": repository.name,
			"id": repository.id,
			"query_id": repository.query_id,
			"db_su_enabled": dependabot_security_updates,
			"security_and_analysis_status": repository.result_object.security_and_analysis.dependabot_security_updates.status,
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

