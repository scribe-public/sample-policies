package verify

import future.keywords.in
import data.scribe as scribe

default allow := false
default violations := []
default branches = ["main", "master"]
default access_level_description := ""
default asset := {}

asset = scribe.get_asset_data(input.evidence)

branches = input.config.args.branches {
	input.config.args.branches != null
}

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
	v := "Code owner approval is required for the specified branch"
}

reason = v {
	not allow
	v := "Code owner approval check failed"
}

violations = j {
	j := {r |
		some name in branches
		co_approval_error(name)
		r := co_approval_error(name)
	}
}

match_any_name(n) {
    some branch in input.evidence.predicate.content[_].branch
	branch.name == n
}

co_approval_error(name) = v {
	some branch in input.evidence.predicate.content[_].branch
	branch.name == name
	branch.result_object.branch_protection.code_owner_approval_required == null
	v = {
		"project": branch.name,
		"description": "code_owner_approval_required is not set",
	}
}

co_approval_error(name) = v {
	some branch in input.evidence.predicate.content[_].branch
	branch.name == name
	branch.result_object.branch_protection.code_owner_approval_required != null
	branch.result_object.branch_protection.code_owner_approval_required != true
	v = {
		"project": branch.name,
		"description": "code owner approval is not required",
	}
}
