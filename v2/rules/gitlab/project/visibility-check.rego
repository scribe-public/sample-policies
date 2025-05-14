package verify

import future.keywords.in
import data.scribe as scribe

default allow := false
default violations := []
default visibility := "private"
default asset := {}

asset = scribe.get_asset_data(input.evidence)

visibility = input.config.args.visibility {
    input.config.args.visibility
}

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
		"errors": errors,
	}
}

allow {
	count(violations) == 0
}

reason = v {
	allow
	v := "project visibility matches requested value"
}

reason = v {
	not allow
	v := "project visibility does not match requested value"
}

errors[msg] {
	some content in input.evidence.predicate.content
	content.project.result_object
	not content.project.result_object.visibility
	msg = "visibility not found in project"
}

errors[msg] {
	some content in input.evidence.predicate.content
	content.project.result_object
	not content.project.result_object.name
	msg = "project name not found in project"
}

errors[msg] {
	not input.config.args.visibility
	msg = "visibility not found in config"
}

violations = j {
	j := {r |
        project = input.evidence.predicate.content[_].project.result_object
		project.visibility != visibility
        r = {
            "project": project.name,
			"visibility": project.visibility,
        }
	}
}
