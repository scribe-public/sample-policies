package verify

import future.keywords.in

default allow := false

default violations := []

default valid_regex_list := []


valid_regex_list = input.config.args.valid_regex_list {
    input.config.args.valid_regex_list
} 


verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "A rule to verify that all binary fields in security and analysis are correct",
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
	v := "All fields in security and analysis are correct"
}

reason = v {
	not allow
	v := "There is at least one fields in security and analysis which is not correct"
}



# j is now a list in order to make sure duplications are not lost

violations = j {
	j := [r |

		projects := object.remove(input.evidence.predicate.content, {"metadata"})
        project := projects[_]
        repositories := project.repository
        repository := repositories[_]
		repository.result_object.visibility == "public"
		not is_valid(repository)

		r := {
            "scribe_type": repository.scribe_type,
            "name": repository.name,
			"id": repository.name,
			"query_id": repository.query_id,
            # "result_object": repository.result_object,
			
        }
	]
}

