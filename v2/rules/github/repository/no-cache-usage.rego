package verify

import future.keywords.in

default allow := false
default violations := []
default sbom_missing := false


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

sbom_missing {
       some repository in input.evidence.predicate.content
       repository.repository
       not repository.sbom
}

sbom_missing {
       some repository in input.evidence.predicate.content
       repository.repository
       count(repository.sbom) == 0
}

allow {
	not sbom_missing
	count(violations) == 0
}

reason = v {
	allow
	v := "No use of cache was detected"
}

reason = v {
	not allow
	not sbom_missing
	v := "Some use of cache was detected"
}

reason = v {
       not allow
       sbom_missing
       v := "No SBOM was found in the repository discovery evidence"
}

violations = j {
	j := [r |
    
		repository := input.evidence.predicate.content[_]
        packages := repository.sbom[0].result_object.sbom.packages
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
