package verify

import future.keywords.in

default allow := false

default violations := []

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "Unsigned commit",
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
	v := "All the commits are signed"
}

reason = v {
	not allow
	v := "There is at least one unsigned commit"
}


violations = j {

	j := { r |

		project := input.evidence.predicate.content[_]
		commit := project.commit[_]

		not is_valid(commit)

		r := {
			"scribe_type": commit.scribe_type,
			"name": commit.name,
			"id": commit.id,
			"result_object": {
				"author": commit.result_object.author,
				"verification": commit.result_object.verification,
				"committer": commit.result_object.committer,
				"web_url": commit.result_object.web_url,
			},
			"timestamp": commit.timestamp,	
		}
	}
}

is_valid(commit) {

	commit.result_object.verification.verified
}




