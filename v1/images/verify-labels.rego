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
			"type": "Missing Labels",
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
	v := "Image contains all required labels"
}

reason = v {
	not allow
	v := "Image does not contain all required labels"
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
