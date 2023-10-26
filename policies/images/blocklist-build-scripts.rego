package verify

import future.keywords.in

default allow := false

default violations := []

default property = {
	"name": "",
	"value": "",
}

default msg := "Image build commands used blocklisted scripts"

verify = v {
	v := {
		"allow": allow,
		"violation": {"details": violations},
		"summary": [{
			"allow": allow,
			"reason": msg,
			"details": json.marshal(violations),
			"violations": count(violations),
		}],
	}
}

allow {
	count(violations) == 0
}

violations = j {
	j := {r |
		some blocklisted in input.config.args.blocklist
		some component in input.evidence.predicate.bom.components
		some property in component.properties
		property.name == "CreatedBy"
		contains(property.value, blocklisted)
		r = {"script": property.value}
	}
}

msg = "Image build commands do not use blocklisted scripts"
