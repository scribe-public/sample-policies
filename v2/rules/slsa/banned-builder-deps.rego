package verify

import future.keywords.in

default allow := false

default violations := []

default dependency := {"uri": "", "name": "", "annotations": {"version": ""}}

default asset := {}

asset = scribe.get_asset_data(input.evidence)

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "Blocklisted Dependencies",
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
	v := "All of the dependencies(packages) are *not* on the blocklist"
}

reason = v {
	not allow
	v := "Several dependencies(packages) are on the blocklist"
}

violations = j {
	j := {r |
		some blocklisted in input.config.args.blocklist
		some dependency in input.evidence.predicate.runDetails.builder.builderDependencies
		name_match(dependency, blocklisted.name)
		version_match(dependency, blocklisted)
		r = {
			"name": blocklisted.name,
			"version": dependency.annotations.version,
		}
	}
}

name_match(dependency, name) {
	dependency.name == name
}

name_match(dependency, name) {
	contains(dependency.uri, name)
}

version_match(dependency, blocklisted) {
	not blocklisted.version
}

version_match(dependency, blocklisted) {
	dependency.annotations.version == blocklisted.version
}
