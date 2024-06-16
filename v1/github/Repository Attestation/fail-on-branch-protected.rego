package verify

import future.keywords.in

default allow := false

default violations := []

default predefined_protected := true


predefined_protected := input.config.args.predefined_protected 


verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "A rule to verify that branch protected is set to the value defined in the configuration file.",
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
	v := "All values of branch protected are set to the value defined in the configuration file."
}

reason = v {
	not allow
	v := "There is at least one value of branch protected is not set to the value defined in the configuration file."
}



# j is now a list in order to make sure duplications are not lost

violations = j {
	j := [r |

		projects := object.remove(input.evidence.predicate.content, {"metadata"})
        project := projects[_]
        branches := project.branch
		branch := branches[_]

		not is_valid(branch)

		r := {
			"scribe_type": branch.scribe_type,
            "name": branch.name,
			"id": branch.id,
			"query_id": branch.query_id,
			"predefined_protected": predefined_protected,
			"protected": branch.result_object.protected,
            # "result_object": branch.result_object,
			
        }
	]
}

# Must get a better understanding of how to check if a repo is in a list of valid predefined regexes
is_valid(branch) {
	predefined_protected == branch.result_object.protected 
}