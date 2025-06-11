package verify

import data.sarif
import data.scribe as scribe

default allow := false
default violations := []
default asset := {}

asset = scribe.get_asset_data(input.evidence)

short_description = "Verify type, level and number of vulnerabilities in SARIF report"

description = "Verify type, level and number of vulnerabilities in SARIF report"

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "Invalid Sarif",
			"details": violations,
		},
		"asset": asset,
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
	v := sprintf("%d violations | %d max allowed", [count(violations), input.config.args.max_allowed])
}

allow {
	sarif.allow(input.config.args) == {true}
}

violations = v {
	v := sarif.violations(input.config.args)
}
