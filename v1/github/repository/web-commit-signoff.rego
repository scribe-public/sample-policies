package verify

import future.keywords.in

default allow := false

default violations := []

default desired_value := false

desired_value {
    input.config.args.desired_value
}

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
	v := "web_commit_signoff is properly set"
}

reason = v {
	not allow
	v := "web_commit_signoff is not properly set"
}

violations = j {
	j := [r |

		project := input.evidence.predicate.content[_]
		some ancestor in project.ancestors
		ancestor.scribe_type == "organization"
        organization_details := ancestor.result_object.organization_details
        organization_details.web_commit_signoff_required != desired_value

		r := {
            "name": ancestor.result_object.name,
			"id": ancestor.result_object.id,
			"query_id": ancestor.result_object.query_id,
            "organization_details": organization_details,
        }
	]
}

