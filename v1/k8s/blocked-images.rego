package verify

import future.keywords.in

default allow := false

default violations := []

default images_to_include := ["scribesecuriy.jfrog.io"]

images_to_include = input.config.args.images_to_include {
	input.config.args.images_to_include
} 

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "A rule to verify that images are allowed",
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
	v := "All images are allowed"
}

reason = v {
	not allow
	v := "There is at least one image that is not allowed"
}



# j is now a list in order to make sure duplications are not lost

violations = j {
	j := [r |

		projects := object.remove(input.evidence.predicate.content, {"metadata"})
		
		project := projects[_]
		namespace := project.namespace[_]
		image := namespace.result_object.container_info[0].image
		not is_valid(image)

		r := {
            "name": namespace.name,
			"id": namespace.name,
			"query_id": namespace.query_id,
			"image": image,
            "is_invalid_image": true,
        }
	]
}

is_valid(image) {
	some prefix in images_to_include
	startswith(image, prefix)
}
