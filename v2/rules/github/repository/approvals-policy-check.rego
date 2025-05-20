package verify

import future.keywords.in
import data.scribe as scribe

default allow := false
default violations := []
default asset := {}
default approvals_required_min := 1

asset = scribe.get_asset_data(input.evidence)

approvals_required_min = input.config.args.approvals_required_min

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
	allow
	v := "Default branch protection rules meet the requirements"
}

reason = v {
	not allow
	violations[0].required_pull_request_reviews != 0
	v := sprintf("Default branch protection rules do not meet the requirements: %d reviews configured, %d reviews required by policy", [violations[0].required_pull_request_reviews, approvals_required_min])
}

reason = v {
	not allow
	violations[0].required_pull_request_reviews == 0
	v := "Pull request approval is not required for the default branch"
}

violations = j {
	j := [r |

		project := input.evidence.predicate.content[_]
        default_branch := project.repository.result_object.default_branch
        branches := project.branch
		some branch in branches
        # branch.name == default_branch
		not secured_branch(branch)

		r := {
            "name": branch.name,
			"default_branch": default_branch,
			"id": branch.id,
			"protected": branch.result_object.protected,
            "protection_enabled": branch.result_object.protection.enabled,
			"required_pull_request_reviews": get_required_approving_review_count(branch),
        }
	]
}

get_required_approving_review_count(branch) = v {
	branch.result_object.branch_protection != null
	branch.result_object.branch_protection["required_pull_request_reviews.required_approving_review_count"] != null
	v := branch.result_object.branch_protection["required_pull_request_reviews.required_approving_review_count"]
} else = 0

# get_required_approving_review_count(branch) = v {
# 	branch.result_object.branch_protection == null
# 	v := 0
# }

# get_required_approving_review_count(branch) = v {
# 	branch.result_object.branch_protection != null
# 	branch.result_object.branch_protection["required_pull_request_reviews.required_approving_review_count"] == null
# 	v := 0
# }

secured_branch(branch) = true {
	branch.result_object.protected == true
	branch.result_object.protection.enabled == true
	branch.result_object.branch_protection != null
	branch.result_object.branch_protection["required_pull_request_reviews.required_approving_review_count"] != null
	branch.result_object.branch_protection["required_pull_request_reviews.required_approving_review_count"] >= approvals_required_min
} else = false
