package verify

import future.keywords.in

default allow := false

default violations := []

default asset := {}

asset = scribe.get_asset_data(input.evidence)

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "Use of org secrets",
		},
		"asset": asset,
		"summary": [{
			"allow": allow,
			"reason": reason,
		}],
	}
}

allow {
	some project in input.evidence.predicate.content
    not project.hosted_runners
}

reason = v {
	allow
	v := "No self-hosted runners were detected"
}

reason = v {
	not allow
	v := "At least one self-hosted runner was detected"
}

violations = v{
	not allow
	v := [{"msg": "Self-hosted runners were detected"}]
}

