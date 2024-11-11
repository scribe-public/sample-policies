package verify

import future.keywords.in

default allow := false

default violations := []


verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "exposed credentials",
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
	v := sprintf("%d violations | 0 max allowed", [count(violations)])
}

violations = j {
	j := {r |
        some credentials in input.evidence.predicate.content.metadata.args.valint
        client_secret := credentials.client_secret
        not contains(client_secret, "********")
        r = {
            "project": "project",
            "secret": client_secret,
        }
	}
}
