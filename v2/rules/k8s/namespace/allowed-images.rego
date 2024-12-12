package verify

import future.keywords.in
import data.scribe as scribe

default allow := false
default violations := []
default images_to_include := []
default asset := {}

asset = scribe.get_asset_data(input.evidence)

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
	v := "All images are allowed"
}

reason = v {
	not allow
	v := "There is at least one image that is not allowed"
}



# j is now a list in order to make sure duplications are not lost

violations = j {
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
