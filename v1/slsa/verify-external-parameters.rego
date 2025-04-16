package verify

import future.keywords.in
import data.scribe as scribe

default allow := false
default violations := []

external_parameters_path := ["predicate", "buildDefinition", "externalParameters"]

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "Missing field",
			"description": sprintf("provenance doesn't contain required fields: %s, max error threshold: %d", [violations, input.config.args.violations_threshold]),
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
	count(violations) <= input.config.args.violations_threshold
}

reason = v {
	allow
	v := "Provenance document contains all required externalParameters"
}

reason = v {
	not allow
	v := "Provenance document does *not* contain all required externalParameters"
}

violations = j {
	j := {r |
		some path in object.keys(input.config.args.parameters)
		required := input.config.args.parameters[path]
		tokens := array.concat(external_parameters_path, split(path, "/"))
		actual_value := object.get(input.evidence, tokens, "doesn't exist")
		not valid_value(required, actual_value)
		r = {
			"external_parameter_path": path,
			"required": required,
			"actual": actual_value,
		}
	}
}

valid_value(required, actual) {
	is_number(required)
	actual_num = to_number(actual)
	required == actual_num
}

valid_value(required, actual) {
	is_string(required)
	required == actual
}

valid_value(required, actual) {
	is_array(required)
	actual_number := to_number(actual)
	is_number(actual_number)
	actual_number in required
}

valid_value(required, actual) {
	is_array(required)
	actual in required
}

valid_value(required, actual) {
	is_object(required)
	act_number = to_number(actual)
	"min" in object.keys(required)
	"max" in object.keys(required)
	required["min"] <= act_number
	required["max"] >= act_number
}

valid_value(required, actual) {
	required == actual
}