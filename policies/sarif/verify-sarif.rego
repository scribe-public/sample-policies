package verify

import data.sarif

default allow := false

default violations := []

short_description = "Verify type, level and number of vulnerabilities in SARIF report"

description = "Verify type, level and number of vulnerabilities in SARIF report"

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "Invalid Sarif",
			"details": violations,
		},
		"short_description": short_description,
		"description": description,
		"summary": [{
			"allow": allow,
			"reason": reason,
			"violations": count(violations),
		}],
	}
}

reason = v {
	allow
	v := sprintf("valid Sarif found, %d failed rules under max violation limit %d", [count(violations), input.config.args.max_allowed])
}

reason = v {
	not allow
	v := sprintf("invalid Sarif found, %d failed rules exceeds max violation limit %d", [count(violations), input.config.args.max_allowed])
}

allow {
	sarif.allow(input.config.args) == {true}
}

violations = v {
	v := sarif.violations(input.config.args)
}
