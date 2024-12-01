package verify

import future.keywords.in
import data.scribe as scribe

default allow := false

default violations := []

default asset := {}

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
	v := "reject_unsigned_commits is enabled for the project"
}

reason = v {
	not allow
	v := "reject_unsigned_commits is not enabled for the project"
}

violations = j {
	j := {r |
        project = input.evidence.predicate.content[_].project.result_object
		reject_unsigned_commits_error(project)
        r = {
            "project": project.name,
        }
	}
}

reject_unsigned_commits_error(project) {
	not project.push_rules
}

reject_unsigned_commits_error(project) {
	project.push_rules.reject_unsigned_commits == null
}

reject_unsigned_commits_error(project) {
	project.push_rules.reject_unsigned_commits != true
}

asset := scribe.get_asset_data(input.evidence)