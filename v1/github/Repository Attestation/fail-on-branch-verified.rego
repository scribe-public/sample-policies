package verify

import future.keywords.in

default allow := false

default violations := []

default desired_verified := true


desired_verified := input.config.args.desired_verified 


verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "A rule to verify that branch verified is set to the value defined in the configuration file.",
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
	v := "All values of branch verified are set to the value defined in the configuration file."
}

reason = v {
	not allow
	v := "There is at least one value of branch verified is not set to the value defined in the configuration file."
}



# j is now a list in order to make sure duplications are not lost

violations = j {
	j := [r |

		projects := object.remove(input.evidence.predicate.content, {"metadata"})
        project := projects[_]
        branches := project.branch
		branch := branches[_]
		verified := branch.result_object.head_commit_verification.verified

		not is_valid(branch)

		r := {
			"scribe_type": branch.scribe_type,
            "name": branch.name,
			"id": branch.id,
			"query_id": branch.query_id,
			"desired_verified": desired_verified,
			"result_object": {
				"head_commit_verification": {
					"verified": verified
				}
			}
            # "result_object": branch.result_object,
			
        }
	]
}

# Must get a better understanding of how to check if a repo is in a list of valid predefined regexes
is_valid(branch) {

	desired_verified == branch.result_object.head_commit_verification.verified
}