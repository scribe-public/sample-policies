package verify

import future.keywords.in

default allow := false

default violations := []

default max_secret_age := 12 

default asset := {}

asset = scribe.get_asset_data(input.evidence)

max_secret_age = input.config.args.max_secret_age {
    input.config.args.max_secret_age
} 

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "Old secret",
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
	v := "No secrets are older than the threshold"
}

reason = v {
	not allow
	v := "There is at least one secret that's older than the threshold"
}

violations = j {
	j := [r |

		project := input.evidence.predicate.content[_]
        secrets := project.secret
        secret := secrets[_]

		ts := secret.result_object.created_at
		months := months_since(ts)

		months > max_secret_age

		r := {
            "scribe_type": secret.scribe_type,
            "name": secret.name,
			"id": secret.id,
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

