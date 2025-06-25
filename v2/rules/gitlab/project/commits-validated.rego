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
	v := "all commits are validated"
}

reason = v {
	not allow
	v := "some commits  are not validated"
}

violations = j {
	j := {r |
        some commit in input.evidence.predicate.content[_].commit
		not commit.result_object.validated
        r = {
			"commit": commit.id,
			"title": commit.result_object.title,
			"message": commit.result_object.message,
        }
	}
}
