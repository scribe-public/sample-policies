package verify

import future.keywords.in
import data.scribe as scribe

default allow = false
default violations = []
default allowed_registries = []
default asset := {}

asset = scribe.get_asset_data(input.evidence)

allowed_registries = input.config.args.allowed_registries {
	input.config.args.allowed_registries
}

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "Not Allowed Packages",
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
	count(violations) <= 0
}

reason = v {
	allow
	v := "All NPM packages in the SBOM are from the allowed registries"
}

reason = v {
	not allow
	v := "Several NPM packages in the SBOM are *not* from the allowed registries"
}

violations = j {
	j := {r |
		some component in input.evidence.predicate.bom.components
		component.group == "npm"
		some property in component.properties
		property.name == "scribe:pkg:npm:registryUrl"
		not allowed_registry(property.value)
		r = {
			"name": component.name,
			"bom-ref": component["bom-ref"],
			"registry": property.value,
		}
	}
}

allowed_registry(reg) {
	some allowed in allowed_registries
	startswith(lower(reg), lower(allowed))
}
