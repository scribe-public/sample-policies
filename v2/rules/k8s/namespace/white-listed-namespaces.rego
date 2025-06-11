package verify

import future.keywords.in
import data.scribe as scribe

default allow := false
default violations := []
default namespaces := []
default asset := {}

asset = scribe.get_asset_data(input.evidence)

namespaces = input.config.args.namespaces {
	input.config.args.namespaces
} 

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "A rule to verify that all namespace are allowed",
			"details": violations,
		},
		"asset": asset,
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
	v := "All namespace are allowed"
}

reason = v {
	not allow
	v := "There is at least one namespace that is not allowed"
}



# j is now a list in order to make sure duplications are not lost

violations = j {
	j := [r |

		projects := input.evidence.predicate.content[_]
		
		project := projects[_]
		namespace := project.namespace
		
		not is_valid(namespace)

		r := {
			"scribe_type": namespace.scribe_type,
            "name": namespace.name,
			"id": namespace.id,
			"query_id": namespace.query_id,
        }
	]
}

is_valid(namespace) {
	count(namespaces) > 0
	name := namespace.name
	some pattern in namespaces
	regex.match(pattern, name)
}
