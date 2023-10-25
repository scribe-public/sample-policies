package verify

import data.sarif

default allow := false

default violations := []

verify = v {
	v := {
		"allow": allow,
		"violations": violations,
		"summary": [{
			"allow": allow,
			"reason": sprintf("# of violations: %d (max allowed: %d)", [count(violations), input.config.args.max_allowed]),
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
