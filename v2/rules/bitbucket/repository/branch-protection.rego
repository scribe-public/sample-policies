package verify

import future.keywords.in
import data.scribe as scribe

default allow := false

default violations := []

input_branches := input.config.args.branches

verify = v {
    v := {
        "allow": allow,
        "violation": {
            "type": "Misconfiguration",
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
        repo_key := input.evidence.predicate.content.metadata.repository_list[_]
        protected_branches := [
            branch_protection.result_object.branches[_] |
            branch_protection := input.evidence.predicate.content[repo_key].branch_protection[_]
        ]
        branch := input_branches[_]
        not branch_in_protected(branch, protected_branches)
        r := {
            "branch": branch,
            "is_protected": false
        }
    ]
}

violations = j {
	j := {r |
			count(unprotected_branches) > 0
			r = {"unprotected_branches": unprotected_branches}
	}
}

branch_in_protected(input_branch, protected_branches) {
    some protected_branch in protected_branches
    protected_branch == input_branch
}
