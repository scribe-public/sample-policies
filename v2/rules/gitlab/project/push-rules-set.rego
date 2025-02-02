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
	v := "push ruls are defined for the project"
}

reason = v {
	not allow
	v := "push rules are not defined for the following projects"
}

violations = j {
	j := {r |
        project = input.evidence.predicate.content[_].project.result_object
		project.push_rules == null
        r = {
            "project": project.name,
        }
	}
}
