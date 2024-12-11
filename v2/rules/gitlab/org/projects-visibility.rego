package verify

import future.keywords.in

default allow := false

default violations := []

default asset := {}

asset = scribe.get_asset_data(input.evidence)

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
	count(violations) == 0
}

reason = v {
	allow
	v := "No disallowed project with public visibility"
}

reason = v {
	not allow
	v := "Some of the project with public visibility are not in the allowed list"
}

violations = j {
	j := {r |
        some project in input.evidence.predicate.content[_].project
        project.result_object.visibility == "public"
		not match_any(project.name)
        r = {
            "project_name": project.name,
        }
	}
}

match_any(name) {
    allowed_public = input.config.args.allowed_public
	some allowed in allowed_public
	name == allowed
}