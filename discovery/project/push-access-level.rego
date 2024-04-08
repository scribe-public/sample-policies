package verify

import future.keywords.in

default allow := false

default violations := []

default name = "main"

default access_level_description := ""

name = input.config.args.branch_name

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
	v := "push access level rules meet the requirements"
}

reason = v {
	not allow
	v := "push access level rules do not meet the requirements"
}

violations = j {
	j := {r |
		r = push_access_level_error()
	}
}

match_any_name(n) {
    some branch in input.evidence.predicate.content[_].branch
	branch.name == n
}

match_any_level(branch) {
    some rule in branch.result_object.branch_protection.result_object.push_access_levels
	rule.access_level == input.config.args.access_level
}

match_any_level_description(branch) {
    some rule in branch.result_object.branch_protection.result_object.push_access_levels
	rule.access_level_description == access_level_description
}

push_access_level_error() = v {
	not match_any_name(name)
	v = {
		"branch_not_found": name,
	}
}

push_access_level_error() = v {
	some branch in input.evidence.predicate.content[_].branch
	branch.name == name
	branch.result_object.branch_protection.result_object.push_access_levels == null
	v = {
		"branch": branch.name,
	}
}

push_access_level_error() = v {
	access_level_description == ""
	some branch in input.evidence.predicate.content[_].branch
	branch.name == name
	branch.result_object.branch_protection.result_object.push_access_levels != null
	not match_any_level(branch)
	v = {
		"project": branch.name,
		"available_rules": branch.result_object.branch_protection.result_object.push_access_levels,
	}
}

push_access_level_error() = v {
	access_level_description != ""
	some branch in input.evidence.predicate.content[_].branch
	branch.name == name
	branch.result_object.branch_protection.result_object.push_access_levels != null
	not match_any_level_description(branch)
	v = {
		"project": branch.name,
		"available_rules": branch.result_object.branch_protection.result_object.push_access_levels,
	}
}
