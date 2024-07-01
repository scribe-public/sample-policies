package verify

import future.keywords.in

default allow := false

default violations := []

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "A rule to verify that all secrets are not expired",
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
	v := "all secrets are not expired"
}

reason = v {
	not allow
	v := "There is at least one expired secret"
}

secrets = s {
	containers := object.remove(input.evidence.predicate.content, {"metadata"})
	s := {s}
}



#TODO:
# require secrets in the evidence in order to properly check if secrets are expired
# require a better understanding of how secret objects are formed.

violations = j {
	j := {r |
		containers := object.remove(input.evidence.predicate.content, {"metadata"})
		container := containers[_]
		secrets := container.secret

        count(secrets) > 0 # Checks if there are any secrets

		secret := secrets[_]

		is_expired(secret)

		# Must add the proper attributes to display
		r := { 
			"name": secret.name,
			"id": secret.id,
			"is_expired": true,
		} 


	}
}

is_expired(secret) {

	# Must implement a way to check if a secret is expired based off how the object is formed
}
