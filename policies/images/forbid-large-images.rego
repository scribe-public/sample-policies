package verify

import future.keywords.if

default allow := false

default size := 10000000000

verify = v if {
	v := {
		"allow": allow,
		"errors": errors,
		"violation": {
			"type": "Too Large Image",
			"details": [{"msg": sprintf("Actual image size %d exceeds max allowed %d", [size, input.config.args.max_size])}],
		},
		"summary": [{
			"allow": allow,
			"reason": reason,
		}],
	}
}

size = to_number(input.evidence.predicate.bom.components[j].properties[i].value) if {
	comp := input.evidence.predicate.bom.components[j]
	comp.group == "layer"
	comp.properties[i].name == "size"
	comp.properties[z].name == "index"
	comp.properties[z].value == "0"
}

allow if {
	size <= input.config.args.max_size
}

reason = v if {
	allow
	v := "image is within allowed size"
}

reason = v if {
	not allow
	v := "image is too big"
}

errors[msg] {
	size == 10000000000
	msg := "image size not presented"
}
