package verify

import future.keywords.in

default allow := false

default violations := []


verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "Use of cache",
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
	v := "No use of cache was detected"
}

reason = v {
	not allow
	v := "Some use of cache was detected"
}

violations = j {
	j := [r |
    
		project := input.evidence.predicate.content[_]

        packages := project.sbom[0].result_object.sbom.packages
        package_var := packages[_]

        is_cache(package_var)

		r := {
			"SPDXID": package_var.SPDXID,
            "name": package_var.name,
            "versionInfo": package_var.versionInfo,
            "externalRefs": package_var.externalRefs,
        }
	]
}

is_cache(package_var) {
    startswith(package_var.externalRefs[0].referenceLocator, "pkg:githubactions/actions/cache")
}
