package verify

import future.keywords.in

default allow := false

default violations := []

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "admins",
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
	v := "all commits are committed by allowed committers"
}

reason = v {
	not allow
	v := "some commits are not committed by allowed committers"
}

violations = j {
	j := {r |
        some commit in input.evidence.predicate.content[_].commit
		not match_any_name(commit)
        r = {
			"commit": commit.id,
			"committer": commit.result_object.committer_email,
        }
	}
}

match_any_name(commit) {
    some committer in input.config.args.allowed_committers
	commit.result_object.committer_email == committer
}

