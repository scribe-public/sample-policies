package verify

import future.keywords.in

default allow := false

default violations := []

default property = {
	"name": "",
	"value": "",
}

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "Banned Scripts",
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
	count(violations) == 0
}

reason = v {
	allow
	v := "image build commands do not use banned scripts"
}

reason = v {
	not allow
	v := "image build commands used banned scripts"
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
