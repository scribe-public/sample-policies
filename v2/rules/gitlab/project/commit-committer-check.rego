package verify

import future.keywords.in

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
	v := "commit_committer_check is enabled for the project"
}

reason = v {
	not allow
	v := "commit_committer_check is not enabled for the project"
}

violations = j {
	j := {r |
        project = input.evidence.predicate.content[_].project.result_object
		commit_committer_check_error(project)
        r = {
            "project": project.name,
        }
	}
}

commit_committer_check_error(project) {
	not project.push_rules
}

commit_committer_check_error(project) {
	project.push_rules.commit_committer_check == null
}

commit_committer_check_error(project) {
	project.push_rules.commit_committer_check != true
}
