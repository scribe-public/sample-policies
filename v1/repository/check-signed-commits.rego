package verify

import future.keywords.in

default allow := false

default violations := []

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "unsigned commits",
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
	v := "all commits are signed"
}

reason = v {
	not allow
	v := "some commits are not signed"
}

violations = j {
	j := {r |
        some commit in input.evidence.predicate.content[_].commit
		bad_commit(commit)
        r = {
			"commit": commit.id,
			"author": commit.result_object.author_email,
        }
	}
}

bad_commit(commit) {
	not commit.result_object.verification
}

bad_commit(commit) {
	commit.result_object.verification.verified != true
}
