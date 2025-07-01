package verify

import future.keywords.in
import data.scribe as scribe

default allow := false
default violations := []
default asset := {}
default errors := []

asset = scribe.get_asset_data(input.evidence)

# Final Verify Object
verify = result {
  result := {
    "allow": allow,
    "errors": errors,
    "violation": {
      "type": "Image Healthcheck Check",
      "description": "Healthcheck property should be defined in the image component.",
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
# This collects the value of every property in main sbom component properties whose name (lowercased)
# starts with "imagehealthcheck_".
healthcheck_props = [ p.value |
    input.evidence.predicate.bom.metadata.component.properties[i] = p;
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
