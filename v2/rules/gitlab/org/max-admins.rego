package verify

import future.keywords.in
import data.scribe as scribe

default allow := false
default violations := []
default admins := []
default max_admins := 0
default asset := {}

asset := scribe.get_asset_data(input.evidence)

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "admins",
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
	count(admins) <= max_admins
}

max_admins = input.config.args.max_admins {
	input.config.args.max_admins
}

reason = v {
	v := sprintf("%d admins | %d max allowed", [count(admins), max_admins])
}

admins = j {
	j := {r |
			some user in input.evidence.predicate.content[_].user
			user.result_object.admin == true
			r = {
			"user": user.result_object.username,
		}
	}
}

violations = j {
	j := {r |
			count(admins) > max_admins
			r = {"admins": admins}
	}
}
