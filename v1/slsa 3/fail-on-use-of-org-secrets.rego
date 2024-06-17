package verify

import future.keywords.in

default allow := false

default violations := []


verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "Use of org secrets",
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
	v := "No organization secrets were detected"
}

reason = v {
	not allow
	v := "At least one organization secrets was detected"
}

violations = j {
	j := [r |
    
		project := input.evidence.predicate.content[_]

        org_secrets := project.org_secret

		count(org_secrets) > 0

		secret := org_secrets[_]

		r := {
			"scribe_type": secret.scribe_type,
			"name": secret.name,
			"id": secret.id,
			"query_id": secret.query_id,
			"created_at": secret.result_object.created_at,
			"updated_at": secret.result_object.updated_at,
			"platform": secret.platform,
			"timestamp": secret.timestamp,
        }
	]
}

is_cache(package_var) {
    startswith(package_var.externalRefs[0].referenceLocator, "pkg:githubactions/actions/cache")
}
