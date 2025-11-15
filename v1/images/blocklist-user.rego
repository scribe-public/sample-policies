package verify

import future.keywords.in

default allow := false

default violations := []

default user := "root"

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
	v := "Image USER is *not* on the blocklist"
}

reason = v {
	not allow
	v := "Image USER is on the blocklist"
}

violations = j {
	j := {r |
		some user in input.config.args.users
		not match_any(user)
		r = {
			"user": user
		}
	}
}

match_any(user) {
	some property in input.evidence.predicate.bom.metadata.component.properties
	property.name == "user"
	property.value == user.value
}
