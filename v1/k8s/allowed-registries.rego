package verify

import future.keywords.in

default allow := false

default violations := []

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "admins",
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
	v := "all images originate from allowed registries"
}

reason = v {
	not allow
	v := "some images originate from unallowed registries"
}

violations = j {
	j := {r |
        some pod in input.evidence.predicate.content[_].pod
        some info in pod.result_object.container_info
        not match_any(info.imageID)
        r = {
			"name": pod.name,
            "id": pod.id,
            "image": info.image,
            "imageID": info.imageID,
            "containderID": info.containerID,
        }
	}
}

match_any(imageID) {
    some registry in input.config.args.allowed_registries
    # registry_regex := sprintf(".*%s.*", [registry])
    # regex.match(registry_regex, imageID)
    startswith(imageID, registry)
}
