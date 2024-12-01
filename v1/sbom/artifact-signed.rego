package verify

import data.superset.policy as policy
import data.scribe as scribe

default asset := {}

asset = scribe.get_asset_data(input.evidence.predicate.environment)

verify = v {
	v := {
		"allow": true,
		"asset": asset,
		"summary": [{
			"allow": true,
			"reason": "Evidence signature verified",
			"violations": 0,
		}],
	}
}