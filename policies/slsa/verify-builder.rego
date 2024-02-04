package verify

default allow = false

default builder_id = ""

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

violations = j {
	j := {r |
		input.evidence.predicate.buildDefinition.internalParameters.context_type != "github"
		input.evidence.predicate.buildDefinition.internalParameters.hostname != input.config.args.id
		r = {
			"builder_id": input.evidence.predicate.buildDefinition.internalParameters.hostname,
		}
	}
}

violations = j {
	j := {r |
		input.evidence.predicate.buildDefinition.internalParameters.context_type == "github"
		input.evidence.predicate.buildDefinition.internalParameters.run_id != input.config.args.id
		r = {
			"run_id": input.evidence.predicate.buildDefinition.internalParameters.run_id,
		}
	}
}