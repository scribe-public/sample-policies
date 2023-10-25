package verify

import future.keywords.if

default allow := false

default size := 10000000000

default msg := "Image is too big"

verify = v if {
	v := {
		"allow": allow,
		"errors": errors,
		"summary": [{
			"allow": allow,
			"reason": sprintf("%s, actual size is %d (max allowed size is %d)", [msg, size, input.config.args.max_size]),
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

errors[msg] {
	size == 10000000000
	msg := "image size not presented"
}

msg = "Image is within allowed size" if allow
