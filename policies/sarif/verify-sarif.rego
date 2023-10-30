package verify

import data.sarif

default allow := false

default violations := []

short_description = "Verify type, level and number of vulnerabilities in SARIF report"

description = "Verify type, level and number of vulnerabilities in SARIF report"

verify = v {
	v := {
		"allow": allow,
		"violation": {"details": violations},
		"short_description": short_description,
		"description": description,
		"summary": [{
			"allow": allow,
			"reason": sprintf("# of violations: %d (max allowed: %d)", [count(violations), input.config.args.max_allowed]),
			"details": json.marshal(violations),
			"violations": count(violations),
		}],
	}
}

allow {
	sarif.allow(input.config.args) == {true}
}

violations = v {
	v := sarif.violations(input.config.args)
}
