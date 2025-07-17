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
	v := "Force push is not allowed for the specified branches"
}

reason = v {
	not allow
	v := "Force push check failed"
}

violations = j {
	j := {r |
		some name in branches
		push_protection_error(name)
		r := push_protection_error(name)
	}
}

match_any_name(n) {
    some branch in input.evidence.predicate.content[_].branch
	branch.name == n
}

push_protection_error(name) = v {
	some branch in input.evidence.predicate.content[_].branch
	branch.name == name
	branch.result_object.branch_protection.allow_force_push == null
	v = {
		"project": branch.name,
		"description": "allow_force_push is not set",
	}
} else = v {
	some branch in input.evidence.predicate.content[_].branch
	branch.name == name
	branch.result_object.branch_protection.allow_force_push != null
	branch.result_object.branch_protection.allow_force_push == true
	v = {
		"project": branch.name,
		"description": "force push is allowed",
	}
}
