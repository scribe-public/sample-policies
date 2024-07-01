package verify

import future.keywords.in

default allow := false

default violations := []

default name = "main"

default access_level_description := ""

name = input.config.args.branch

access_level_description = input.config.args.access_level_description {
	input.config.args.access_level_description != ""
}

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "branches",
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
	v := "code owner approval is required for the specified branch"
}

reason = v {
	not allow
	v := "code owner approval check failed"
}

violations = j {
	j := {r |
		r = co_approval_error()
	}
}

match_any_name(n) {
    some branch in input.evidence.predicate.content[_].branch
	branch.name == n
}

co_approval_error() = v {
	not match_any_name(name)
	v = {
		"branch_not_found": name,
	}
}

co_approval_error() = v {
	some branch in input.evidence.predicate.content[_].branch
	branch.name == name
	branch.result_object.branch_protection.result_object.code_owner_approval_required == null
	v = {
		"project": branch.name,
		"description": "code_owner_approval_required is not set",
	}
}

co_approval_error() = v {
	some branch in input.evidence.predicate.content[_].branch
	branch.name == name
	branch.result_object.branch_protection.result_object.code_owner_approval_required != null
	branch.result_object.branch_protection.result_object.code_owner_approval_required != true
	v = {
		"project": branch.name,
		"description": "code owner approval is not required",
	}
}
