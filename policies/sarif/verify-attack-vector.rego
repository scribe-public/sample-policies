package verify

import future.keywords.in

default allow := false

default violations := []

verify = v {
	v := {
		"allow": allow,
		"violation": {"details": violations},
		"summary": [{
			"allow": allow,
			"reason": sprintf("# of violations: %d (max allowed: %d)", [count(violations), input.config.args.violations_threshold]),
			"details": json.marshal(violations),
			"violations": count(violations),
		}],
	}
}

allow {
	count(violations) <= input.config.args.violations_threshold
}

violations = j {
	j := {r |
		d := base64.decode(input.evidence.predicate.content)
		provenance := json.unmarshal(d)
		some i
		rule = provenance.runs[_].tool.driver.rules[i]
		contains(rule.fullDescription.text, "The attack vector is")
		find_violation(rule)
		r := {"rule_id": rule.id}
	}
}

find_violation(rule) {
	some vector in input.config.args.attack_vectors
	contains(rule.fullDescription.text, vector)
}
