package verify
import future.keywords.in
default allow := false

default created := 0

default created_str := "unknown"

default violations := []

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": " Base Image Too Old",
			"details": violations,
		},
		"summary": [{
			"allow": allow,
			"reason": reason,
			"violations": count(violations),
		}],
	}
}

nanosecs_per_second = (1000 * 1000) * 1000

nanosecs_per_day = ((24 * 60) * 60) * nanosecs_per_second

maximum_age = input.config.args.max_days * nanosecs_per_day


allow {
	count(violations) == 0
}

reason = v {
	allow
	v := sprintf("Base Image age is below limit %v", [input.config.args.max_days])

}

reason = v {
	not allow
	v := sprintf("Base Image age is above limit %v", [input.config.args.max_days])
}

found_base_image = j {
	some component in input.evidence.predicate.bom.components
	component.group == "container"

	some property in component.properties
	property.name == "IsBaseImage"
	property.value == "true"

	j = component.name

}

violations = j {
	not found_base_image
	j := [{"error": "No base image found"}]
}

violations = j {
	j := {r |
		some component in input.evidence.predicate.bom.components
		component.group == "container"

		some property in component.properties
		property.name == "IsBaseImage"
		property.value == "true"

		some created_property in component.properties
		created_property.name == "created"
		created := time.parse_rfc3339_ns(created_property.value)
		                                 
		time.now_ns() > created + maximum_age
		r := {"max_age": created + maximum_age, "base_image": component.name}
	}
}