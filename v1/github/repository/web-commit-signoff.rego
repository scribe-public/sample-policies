package verify

import future.keywords.in

default allow := false

default violations := []

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
	v := "Contributors to org repos are required to sign off on commits they make through GitHub's web interface"
}

reason = v {
	not allow
	v := "Contributors to org repos are NOT required to sign off on commits they make through GitHub's web interface"
}

violations = j {
	j := [r |

		project := input.evidence.predicate.content[_]
		some ancestor in project.ancestors
		ancestor.scribe_type == "organization"
        organization_details := ancestor.result_object.organization_details
        organization_details.web_commit_signoff_required != true

		r := {
            "name": ancestor.result_object.name,
			"id": ancestor.result_object.id,
			"query_id": ancestor.result_object.query_id,
            "organization_details": organization_details,
        }
	]
}

