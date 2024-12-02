package verify

import data.sarif

default allow := false

default violations := []

short_description = "Verify Blocklist Rules are not present in the SARIF report"

description = "Verify Blocklist Rules are not present in the SARIF report"

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

allow {
    count(violations) == 0
}


reason = v {
	v := sprintf("%d violations over threshold", [count(violations)])
}


violations = j {
	j := {r |
		# d := base64.decode(input.evidence.predicate.content)
		# provenance := json.unmarshal(d)
		some i
		rule = input.evidence.predicate.content.runs[_].tool.driver.rules[i]
		rule.defaultConfiguration.level == "error"
		r := {
			"rule": rule.id,
			"level": rule.defaultConfiguration.level,
			"description": rule.fullDescription.text,
		}
	}
}