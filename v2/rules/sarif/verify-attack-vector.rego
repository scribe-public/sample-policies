package verify

import future.keywords.in

default allow := false
default violations := []


verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "Attack Vectors",
			"details": violations,
		},
		"summary": [{
			"allow": allow,
			"reason": reason,
			"violations": count(violations),
		}],
	}
}

allow {
	count(violations) <= input.config.args.violations_threshold
}

reason = v {
	v := sprintf("%d violations | %d max allowed", [count(violations), input.config.args.violations_threshold])
}

violations = j {
	j := {r |
		# d := base64.decode(input.evidence.predicate.content)
		# provenance := json.unmarshal(d)
		some i
		rule = input.evidence.predicate.content.runs[_].tool.driver.rules[i]
		contains(rule.fullDescription.text, "The attack vector is")
		find_violation(rule)
		r := {
			"rule_id": rule.id,
			"description": rule.fullDescription.text,
		}
	}
}

find_violation(rule) {
	some vector in input.config.args.attack_vectors
	contains(rule.fullDescription.text, vector)
}
