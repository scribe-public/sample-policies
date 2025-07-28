package verify

import future.keywords.if
import data.scribe as scribe

default allow = false
default msg := "Builder mismatch"
default violations := []
default asset := {}

asset = scribe.get_asset_data(input.evidence)

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "Builder Mismatch",
			"details": violations,
		},
		"asset": asset,
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
	v := "Builder ID is in the allowed list"
}

reason = v {
	not allow
	v := "Builder ID is *not* in the allowed list"
}

violations = [{"id": input.evidence.predicate.buildDefinition.internalParameters.context.run_id}] if {
	not input.evidence.predicate.buildDefinition.internalParameters.context.context_type == "local"
	not input.evidence.predicate.buildDefinition.internalParameters.context.run_id == input.config.args.id
}

violations = [{"id": input.evidence.predicate.buildDefinition.internalParameters.context.hostname}] if {
	input.evidence.predicate.buildDefinition.internalParameters.context.context_type == "local"
	not input.evidence.predicate.buildDefinition.internalParameters.context.hostname == input.config.args.id
}
