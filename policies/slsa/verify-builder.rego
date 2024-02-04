package verify

default allow = false

default verify_github := false

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

verify_github = v {
	input.evidence.predicate.buildDefinition.internalParameters.git_url == input.config.args.git_url
	input.evidence.predicate.buildDefinition.internalParameters.git_ref == input.config.args.git_ref
	input.evidence.predicate.buildDefinition.internalParameters.run_id == input.config.args.run_id
	v := true
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
		not verify_github
		r = {
			"run_id": input.evidence.predicate.buildDefinition.internalParameters.run_id,
		}
	}
}