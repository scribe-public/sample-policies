package verify

import future.keywords.in

default allow := false
default violations := []
default asset := {}
default errors := []

# Retrieve Evidence Metadata: We assume the SBOM metadata is available at input.evidence.predicate.bom.metadata.
asset = input.evidence.predicate.bom.metadata

# Final Verify Object
verify = result {
  result := {
    "allow": allow,
    "errors": errors,
    "violation": {
      "type": "Image Healthcheck Check",
      "details": violations
    },
    "asset": asset,
    "summary": [{
      "allow": allow,
      "reason": reason,
      "violations": count(violations)
    }]
  }
}

# Compute Healthcheck Properties
# This collects the value of every property in asset.component.properties whose name (lowercased)
# starts with "imagehealthcheck_".
healthcheck_props = [ p.value |
    asset.component.properties[i] = p;
    startswith(lower(p.name), "imagehealthcheck_")
]

# Decision Logic: Allow if at least one healthcheck property is found.
allow {
  count(healthcheck_props) > 0
}

# Reason for Summary
reason = msg {
  allow
  msg := sprintf("Healthcheck defined: %v", [sprintf("%v", [healthcheck_props])])
}
reason = msg {
  not allow
  msg := "No healthcheck property found in the image."
}

# Violations: If no healthcheck property is found, return a violation.
violations = [ { "error": "Missing healthcheck property" } ] {
  count(healthcheck_props) == 0
}
