package verify

import future.keywords.in

default allow := false

default violations := []

default approved_sources := []

approved_sources = input.config.args.approved_sources {
	input.config.args.approved_sources
} 

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "A rule to verify base images are from an approved source",
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
	v := "Base images are from an approved source"
}

reason = v {
	not allow
	v := "Base image is not from an approved source"
}



# j is now a list in order to make sure duplications are not lost

violations = j {
	j := [r |

		some component in input.evidence.predicate.bom.components
		component.group == "container"

		some property in component.properties
		property.name == "IsBaseImage"
		property.value == "true"

		not is_valid(component.name)

		r := {,
			"version": component.version,
			"base-image": component.name,
			# "component": component
        }
	]
}

is_valid(image) {
	count(approved_sources) > 0
	some pattern in approved_sources
	regex.match(pattern, image)
}
