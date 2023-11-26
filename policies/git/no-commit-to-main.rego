package verify

import future.keywords.in

default allow = false

default branch = "wbr"

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "Commits to main branch",
			"details": [{"branch": branch}],
		},
		"summary": [{
			"allow": allow,
			"reason": reason,
		}],
	}
}

branch = input.evidence.predicate.environment.git_branch

allow {
	branch != "main"
	branch != "master"
}

allow {
	not find_commit_to_main
}

reason = v {
	allow
	v := "no commits to main branch found"
}

reason = v {
	not allow
	v := "found commits to main branch"
}

find_commit_to_main {
	some component in input.evidence.predicate.bom.components
	component.group == "commit"
}
