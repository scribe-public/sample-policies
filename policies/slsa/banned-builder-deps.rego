package verify

import future.keywords.in

default allow := false

default violations := []

default dependency := {"uri": "", "name": "", "annotations": {"version": ""}}

default msg := "The builder has some blocklisted dependencies"

verify = v {
	v := {
		"allow": allow,
		"violation": {"details": violations},
		"summary": [{
			"allow": allow,
			"reason": msg,
			"details": json.marshal(violations),
			"violations": count(violations),
		}],
	}
}

allow {
	count(violations) == 0
}

msg = "No blocklisted dependencies found" {
	allow
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
