package verify

import future.keywords.if

default allow := false

default created := 0

default created_str := "unknown"

verify = v if {
	v := {
		"allow": allow,
		"errors": errors,
		"violation": {
			"type": "Too Old Image",
			"details": [{"max_age": created + maximum_age}],
		},
		"summary": [{
			"allow": allow,
			"reason": reason,
		}],
	}
}

nanosecs_per_second = (1000 * 1000) * 1000

nanosecs_per_day = ((24 * 60) * 60) * nanosecs_per_second

maximum_age = input.config.args.max_days * nanosecs_per_day

created_str = input.evidence.predicate.bom.metadata.component.properties[i].value if {
	input.evidence.predicate.bom.metadata.component.properties[i].name == "created"
}

created = time.parse_rfc3339_ns(created_str)

allow if {
	time.now_ns() < created + maximum_age
}

reason = v if {
	allow
	v := "image is new enough"
}

reason = v if {
	not allow
	v := "image is too old"
}

errors[msg] {
	created_str == "unknown"
	msg := "bom created not presented"
}
