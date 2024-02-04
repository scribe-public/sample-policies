package verify

import future.keywords.if

default allow = false

default bad_hostnames := []

default msg := "Builder mismatch"

default violations := []

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "Builder Mismatch",
			"details": violations,
		},
		"summary": [{
			"allow": allow,
			"reason": reason,
		}],
	}
}

allow {
	count(violations) == 0
}

reason = v {
	allow
	v := "builder matches config"
}

reason = v {
	not allow
	v := "builder mismatch"
}

violations := [{"run_id": input.evidence.predicate.buildDefinition.internalParameters.run_id}] if {
	input.evidence.predicate.buildDefinition.internalParameters.context_type == "github"
	not input.evidence.predicate.buildDefinition.internalParameters.run_id == input.config.args.id
}

violations := [{"builder_id": input.evidence.predicate.buildDefinition.internalParameters.hostname}] if {
	not input.evidence.predicate.buildDefinition.internalParameters.context_type == "github"
	not input.evidence.predicate.buildDefinition.internalParameters.hostname == input.config.args.id
}