package verify

import future.keywords.in
import data.scribe as scribe

default allow := false
default violations := []
default filtered := {"result": "couldn't perform scan"}
default asset := {}

pipelines_check_field := "predicate/content/metadata/args/github/workflow/skip"

asset = scribe.get_asset_data(input.evidence)

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "Missing field",
			"details": violations,
		},
		"asset": asset,
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
	v := "Workflow scan was not skipped"
}

reason = v {
	not allow
	v := "Workflow scan was skipped"
}

violations = j {
	j := {r |
		tokens := split(pipelines_check_field, "/")
		actual_value := sprintf("%v", [object.get(input.evidence, tokens, "doesn't exist")])
		actual_value != "false"
		r = {
			"workflow_skip": actual_value,
		}
	}
}
