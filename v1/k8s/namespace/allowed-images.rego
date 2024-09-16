package verify

import future.keywords.in

default allow := false

default violations := []

default images_to_include := []

images_to_include = input.config.args.images_to_include {
	input.config.args.images_to_include
} 

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "disallowed-images",
			"details": violations,
		},
		"summary": [{
			"allow": allow,
			"reason": reason,
			"violations": count(violations),
		}],
		"errors": errors,
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

errors[msg] {
	input.evidence.predicate == null
	msg := "Predicate is missing"
}

errors[msg] {
	input.evidence.predicate.content == null
	msg := "Content is missing"
}

errors[msg] {
	input.config.args.images_to_include == null
	msg := "Images to include are missing"
}

# j is now a list in order to make sure duplications are not lost

violations = j {
	count(errors) == 0

	j := [r |
		some pod in input.evidence.predicate.content[_].pod
		image = pod.result_object.container_info[0].image
		not is_valid(image)

		r := {
			"name": pod.name,
			"id": pod.id,
			"query_id": pod.result_object.query_id,
			"image": image,
      }
	]
}

is_valid(image) {
	some prefix in images_to_include
	startswith(image, prefix)
}
