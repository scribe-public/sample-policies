package verify

import future.keywords.in

default allow = false

default branch = "wtfbr"

default msg := "Found commits to main branch"

verify = v {
	v := {
		"allow": allow,
		"summary": [{
			"allow": allow,
			"reason": sprintf("%s, found branch: %s", [msg, branch]),
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

find_commit_to_main {
	some component in input.evidence.predicate.bom.components
	component.group == "commit"
}

msg = "No commits to main branch found" {
	allow
}
