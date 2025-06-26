package verify

import future.keywords.in
import data.scribe as scribe

default allow := false
default violations := []
default asset := {}

asset = scribe.get_asset_data(input.evidence)

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "Missing Byproducts",
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
	v := "All required byproducts were created"
}

reason = v {
	not allow
	v := "Not all required byproducts were created"
}

violations = j {
	j := {r |
		some bp in input.config.args.byproducts
		not find_byproduct(bp)
		r = {"missing_byproduct": bp}
	}
}

find_byproduct(bp) {
	some byproduct in input.evidence.predicate.runDetails.byproducts
	byproduct_match(byproduct, bp)
}

byproduct_match(byproduct, bp) {
	byproduct.uri != null
	contains(byproduct.uri, bp)
}

byproduct_match(byproduct, bp) {
	byproduct.digest != null
	some digest in byproduct.digest
	contains(digest, bp)
}

byproduct_match(byproduct, bp) {
	byproduct.content != null
	contains(byproduct.content, bp)
}
