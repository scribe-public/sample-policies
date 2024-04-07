package verify

import future.keywords.in

default allow := false

default violations := []

default name = "main"

default access_level =  30

name = input.config.args.branch_name

access_level = input.config.args.access_level

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
	v := "merge access level rules meet the requirements"
}

reason = v {
	not allow
	v := "merge access level rules do not meet the requirements"
}

violations = j {
	j := {r |
		r = merge_access_level_error()
	}
}

match_any_name(n) {
    some branch in input.evidence.predicate.content[_].branch
	branch.name == n
}

match_any_level(branch) {
    some rule in branch.result_object.branch_protection.result_object.merge_access_levels
	rule.access_level == access_level
}

merge_access_level_error() = v {
	not match_any_name(name)
	v = {
		"branch_not_found": name,
	}
}

merge_access_level_error() = v {
	some branch in input.evidence.predicate.content[_].branch
	branch.name == name
	branch.result_object.branch_protection.result_object.merge_access_levels == null
	v = {
		"branch": branch.name,
	}
}

merge_access_level_error() = v {
	some branch in input.evidence.predicate.content[_].branch
	branch.name == name
	branch.result_object.branch_protection.result_object.merge_access_levels != null
	not match_any_level(branch)
	v = {
		"project": branch.name,
		"available_rules": branch.result_object.branch_protection.result_object.merge_access_levels,
	}
}
