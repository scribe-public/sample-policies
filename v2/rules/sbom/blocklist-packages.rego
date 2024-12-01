package verify

import data.scribe as scribe

default allow = false

default violations = []

default asset := {}

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "Blocklisted Packages",
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

allow {
	count(violations) <= input.config.args.blocklisted_limit
}

reason = v {
	allow
	v := "All packages in the SBOM are *not* on the blocklist"
}

reason = v {
	not allow
	v := "Several packages in the SBOM are on the blocklist"
}

violations = j {
	j := {r |
		components := input.evidence.predicate.bom.components
		some i
		p := components[i].purl
		some k
		b := input.config.args.blocklist[k]
		contains(p, b)
		r = {"package": b}
	}
}

asset := scribe.get_asset_data(input.evidence)
