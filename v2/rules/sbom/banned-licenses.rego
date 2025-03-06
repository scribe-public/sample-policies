package verify

import data.scribe as scribe
import future.keywords.in

default allow = false
default violations = []
default asset := {}

asset = scribe.get_asset_data(input.evidence)

short_description = "Verify if there are no packages with banned licenses in the image"

description = "This policy verifies that there are no packages with banned licenses in the image. It takes list of banned licenses and allowed number of violations as an input and fails if the number of packages that have banned licenses exceeds this limit."

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "Banned Licenses",
			"details": violations,
		},
		"asset": asset,
		"short_description": short_description,
		"description": description,
		"summary": [{
			"allow": allow,
			"reason": reason,
			"violations": count(violations),
		}],
	}
}

reason = v {
	v := sprintf("%d packages using blocklisted licenses | %d max allowed", [count(violations), input.config.args.blocklisted_limit])
}

allow {
	count(violations) <= input.config.args.blocklisted_limit
}

violations = j {
	j := {r |
		components := input.evidence.predicate.bom.components
		some i
		comp := components[i]
		comp.licenses != null
		some j
		l := comp[licenses][j]
		bad_license(l.license)
		r = {
			"package": comp.purl,
			"license": l.license,
		}
	}
}

bad_license(license) {
	some k
	blocked_license := input.config.args.blocklist[k]
	startswith(license.name, blocked_license)
}

bad_license(license) {
	some k
	blocked_license := input.config.args.blocklist[k]
	startswith(license.id, blocked_license)
}

bad_license(license) {
	some k
	blocked_license := input.config.args.blocklist[k]
	startswith(license.expression, blocked_license)
}
