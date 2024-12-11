package verify

import future.keywords.if

default allow = false

default violations = []

default signature := ""

default asset := {}

verify = v if {
	v := {
		"allow": allow,
		"violation": {
			"type": "Unsigned Commits",
			"details": violations,
		},
		"asset": asset,
		"summary": [{
			"allow": allow,
			"reason": reason,
			"violations": count(violations),
		}],
	}
}

allow if {
	count(violations) == 0
}

reason = v {
	allow
	v := "All commits were signed"
}

reason = v {
	not allow
	v := "Several commits were *not* signed"
}

violations = j if {
	j := {r |
		some i, k
		components := input.evidence.predicate.bom.components
		comp := components[i]
		prop := comp.properties[k]
		prop.name == "PGPSignature"
		prop.value == ""
		r = {"commit": comp.name}
	}
}

asset = scribe.get_asset_data(input.evidence)
