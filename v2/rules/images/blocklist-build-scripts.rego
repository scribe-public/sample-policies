package verify

import future.keywords.in
import data.scribe as scribe

default allow := false
default violations := []
default property = {
	"name": "",
	"value": "",
}
default asset := {}

asset = scribe.get_asset_data(input.evidence)

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "Banned Scripts",
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
	count(violations) == 0
}

reason = v {
	allow
	v := "All image build commands are *not* on the blocklist"
}

reason = v {
	not allow
	v := "Several image build commands are on the blocklist"
}

violations = j {
	j := {r |
		some banned in input.config.args.blocklist
		some component in input.evidence.predicate.bom.components
		some property in component.properties
		property.name == "CreatedBy"
		contains(property.value, banned)
		r = {"script": property.value}
	}
}
