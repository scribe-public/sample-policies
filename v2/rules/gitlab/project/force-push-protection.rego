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
	v := "force push is not allowed for the specified branch"
}

reason = v {
	not allow
	v := "force push check failed"
}

violations = j {
	j := {r |
		r = push_protection_error()
	}
}

match_any_name(n) {
    some branch in input.evidence.predicate.content[_].branch
	branch.name == n
}

push_protection_error() = v {
	not match_any_name(name)
	v = {
		"branch_not_found": name,
	}
}

push_protection_error() = v {
	some branch in input.evidence.predicate.content[_].branch
	branch.name == name
	branch.result_object.branch_protection.result_object.allow_force_push == null
	v = {
		"project": branch.name,
		"description": "allow_force_push is not set",
	}
}

push_protection_error() = v {
	some branch in input.evidence.predicate.content[_].branch
	branch.name == name
	branch.result_object.branch_protection.result_object.allow_force_push != null
	branch.result_object.branch_protection.result_object.allow_force_push == true
	v = {
		"project": branch.name,
		"description": "force push is allowed",
	}
}
