package verify

import future.keywords.in

default allow := false

default violations := []

default max_secret_age := 12 

max_secret_age = input.config.args.max_secret_age {
    input.config.args.max_secret_age
} 

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "Secret older than max_secret_age months",
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
	v := "No secrets are older than max_secret_age months"
}

reason = v {
	not allow
	v := "There is at least one secrets are older than max_secret_age months"
}

violations = j {
	j := [r |

		project := input.evidence.predicate.content[_]
        secrets := project.org_secret
        secret := secrets[_]

		ts := secret.result_object.created_at
		months := months_since(ts)

		months > max_secret_age
		
		r := {
            "scribe_type": secret.scribe_type,
            "name": secret.name,
			"id": secret.name,
			"query_id": secret.query_id,
			"created_at": ts,
        }
	]
}

# Function to calculate the number of months between two timestamps
months_since(ts) = months {
    now := time.now_ns()
    then := time.parse_rfc3339_ns(ts)
    diff_ns := now - then
    diff_days := diff_ns / 1000000000 / 86400
    months := diff_days / 30
}

