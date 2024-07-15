package verify

import future.keywords.in

default allow := false

default violations := []

default desired_protected := true


desired_protected := input.config.args.desired_protected 

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "Missconfiguration",
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
	v := "All values of branch protected are set to the desired value  in the configuration file."
}

reason = v {
	not allow
	v := "There is at least one value of branch protected is not set to the desired value in the configuration file."
}

violations = j {
	j := [r |

		project := input.evidence.predicate.content[_]
        branches := project.branch
		branch := branches[_]

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

# Must get a better understanding of how to check if a repo is in a list of valid predefined regexes
is_valid(branch) {
	desired_protected == branch.result_object.protected 
}

