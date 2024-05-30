package verify

import future.keywords.in

default allow := false

default violations := []

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "admins",
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
	v := "reject_unsigned_commits is enabled for the project"
}

reason = v {
	not allow
	v := "reject_unsigned_commits is not enabled for the project"
}

violations = j {
	j := {r |
        branch = input.evidence.predicate.content[_].branch[_].result_object
		reject_unsigned_commits_error(branch)
        r = {
            "project": project.name,
        }
	}
}

reject_unsigned_commits_error(branch) {
	not branch.protection
}

reject_unsigned_commits_error(branch) {
	not branch.protection.enabled
}

reject_unsigned_commits_error(branch) {
	branch.protection.enabled != true
}