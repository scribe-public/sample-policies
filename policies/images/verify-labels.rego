package verify

import future.keywords.in

default msg := "Image doesn't contain required labels"

default allow := false

default violations := []

default property = {
	"name": "",
	"value": "",
}

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
		some label in input.config.args.labels
		not match_any(label)
		r = {
			"label": label.label,
			"value": label.value,
		}
	}
}

match_any(label) {
	some property in input.evidence.predicate.bom.metadata.component.properties
	startswith(property.name, "label_")
	endswith(property.name, label.label)
	property.value == label.value
}

msg = "Image contains all required labels" {
	allow
}
