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
	v := "branch protection is enabled for the repository"
}

reason = v {
	not allow
	v := "branch protection is not enabled for some branches in the repository"
}

violations = j {
	j := {r |
        branch = input.evidence.predicate.content[_].branch[_].result_object
		branch_protection_error(branch)
        r = {
            "branch": branch.name,
        }
	}
}

branch_protection_error(branch) {
	not branch.protection
}

branch_protection_error(branch) {
	not branch.protection.enabled
}

branch_protection_error(branch) {
	branch.protection.enabled != true
}