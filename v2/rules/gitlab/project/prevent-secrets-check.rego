package verify

import future.keywords.in
import data.scribe as scribe

default allow := false
default violations := []
default asset := {}

asset = scribe.get_asset_data(input.evidence)

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "admins",
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
	v := "prevent_secrets is enabled for the project"
}

reason = v {
	not allow
	v := "prevent_secrets is not enabled for the project"
}

violations = j {
	j := {r |
        project = input.evidence.predicate.content[_].project.result_object
		prevent_secrets_error(project)
        r = {
            "project": project.name,
        }
	}
}

prevent_secrets_error(project) {
	not project.push_rules
}

prevent_secrets_error(project) {
	project.push_rules.prevent_secrets == null
}

prevent_secrets_error(project) {
	project.push_rules.prevent_secrets != true
}
