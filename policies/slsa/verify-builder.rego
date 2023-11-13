package verify

default allow = false

default msg := "Builder mismatch"

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "Builder Mismatch",
			"details": [{"msg": sprintf("Builder ID %s does not match config ID %s", [input.evidence.predicate.runDetails.builder.id, input.config.args.id])}],
		},
		"summary": [{
			"allow": allow,
			"reason": reason,
		}],
	}
}

allow {
	input.evidence.predicate.runDetails.builder.id == input.config.args.id
}

reason = v {
	allow
	v := "builder matches config"
}

reason = v {
	not allow
	v := "builder mismatch"
}
