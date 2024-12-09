package verify

import future.keywords.in

default allow := false

default violations := []

default user := "root"

default property = {
	"name": "",
	"value": "",
}

# 2DO make sure no USER field is a violation

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
	v := "Image USER is *not* on the blocklist"
}

reason = v {
	not allow
	v := "Image USER is on the blocklist"
}

violations = j {
	j := {r |
        some property in input.evidence.predicate.bom.metadata.component.properties
        property.name == "user"
		some user in input.config.args.users
        property.value == user
		r = {
			"user": user
		}
	}
}