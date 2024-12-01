package verify

import future.keywords.in
import data.scribe as scribe

default allow := false

default violations := []

default desired_protected := true

default branches := ["*"]

default asset := {}

desired_protected := input.config.args.desired_protected 

branches = input.config.args.branches {
	count(input.config.args.branches) > 0
}

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "Missconfiguration",
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
	v := sprintf("%d unprotected branches | 0 max allowed", [count(unprotected_branches)])
}

unprotected_branches = j {
	j := [r |

		project := input.evidence.predicate.content[_]
        branches := project.branch
		branch := branches[_]

		branch_name_verify(branch)

		not is_valid(branch)

		r := {
			"scribe_type": branch.scribe_type,
            "name": branch.name,
			"id": branch.id,
			"query_id": branch.query_id,
			"protected": branch.result_object.protected,
        }
	]
}

violations = j {
	j := {r |
			count(unprotected_branches) > 0
			r = {"unprotected_branches": unprotected_branches}
	}
}

# Must get a better understanding of how to check if a repo is in a list of valid predefined regexes
is_valid(branch) {
	desired_protected == branch.result_object.protected 
}

branch_name_verify(branch) {
	count(branches) == 0
}

branch_name_verify(branch) {
	count(branches) > 0
	some pattern in branches
	rich_pattern = sprintf("^%s$", [pattern])
	regex.match(rich_pattern, branch.name)
}

asset := scribe.get_asset_data(input.evidence)