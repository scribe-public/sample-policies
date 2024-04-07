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
        some branch in input.evidence.predicate.content[_].branch
		branch.name == name
		r = merge_access_level_error(branch.result_object)
	}
}

match_any(branch) {
    some rule in branch.branch_protection.result_object.merge_access_levels
	rule.access_level == access_level
}

merge_access_level_error(branch) = v {
	branch.branch_protection.result_object.merge_access_levels == null
	v = {
		"branch": branch.name,
	}
}

merge_access_level_error(branch) = v {
	branch.branch_protection.result_object.merge_access_levels != null
	not match_any(branch)
	v = {
		"project": branch.name,
		"available_rules": branch.branch_protection.result_object.merge_access_levels,
	}
}
