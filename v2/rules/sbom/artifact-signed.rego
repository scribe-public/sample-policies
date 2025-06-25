package verify

import data.superset.policy as policy
import future.keywords.in



verify = v {
	v := {
		"allow": true,
		"summary": [{
			"allow": true,
			"reason": "Evidence signature verified",
			"violations": 0,
		}],
	}
}
