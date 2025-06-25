package verify

import data.superset.policy as policy


verify = v {
	v := {
		"allow": true,
		"summary": [{
			"allow": true,
			"reason": "Provenance exists",
			"violations": 0,
		}],
	}
}
