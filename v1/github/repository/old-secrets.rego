package verify

import future.keywords.in

default allow := false

default violations := []

default k := 12 

k = input.config.args.k {
    input.config.args.k
} 

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "Secret older than k months",
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
	v := "No secrets are older than k months"
}

reason = v {
	not allow
	v := "There is at least one secrets are older than k months"
}

violations = j {
	j := [r |

		project := input.evidence.predicate.content[_]
        secrets := project.org_secret
        secret := secrets[_]

		ts := secret.result_object.created_at
		months := months_since(ts)

		months > k
		
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

