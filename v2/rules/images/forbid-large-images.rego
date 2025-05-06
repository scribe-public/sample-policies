package verify

import data.scribe as scribe

default allow := false
default size := 10000000000
default violations := []
default asset := {}

asset = scribe.get_asset_data(input.evidence)

verify = v {
	v := {
		"allow": allow,
		"errors": errors,
		"violation": {
			"type": "Too Large Image",
			"details": violations,
		},
		"asset": asset,
		"summary": [{
			"allow": allow,
			"reason": reason,
		}],
	}
}

size = to_number(input.evidence.predicate.bom.components[j].properties[i].value) {
	comp := input.evidence.predicate.bom.components[j]
	comp.group == "layer"
	comp.properties[i].name == "size"
	comp.properties[z].name == "index"
	comp.properties[z].value == "0"
}

allow {
	size <= input.config.args.max_size
}

reason = v {
	allow
	v := "Image size below limit"
}

reason = v {
	not allow
	v := "Image size above limit"
}

errors[msg] {
	size == 10000000000
	msg := "image size not presented"
}

violations = v {
	not allow
	v := [{
		"msg": sprintf("Actual image size %d exceeds max allowed %d", [size, input.config.args.max_size]),
	}]
}
