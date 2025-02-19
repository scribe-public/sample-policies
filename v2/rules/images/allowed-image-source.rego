package verify

import data.scribe as scribe
import future.keywords.in

##########################################################################
# Default Declarations
##########################################################################

default allow := false
default violations := []
default asset := {}
default approved_sources := []

##########################################################################
# Retrieve Evidence Metadata
##########################################################################
asset = scribe.get_asset_data(input.evidence)

##########################################################################
# Approved Source Patterns
##########################################################################
approved_sources = input.config.args.approved_sources {
  input.config.args.approved_sources
}

##########################################################################
# Final Verify Object
##########################################################################
verify = v {
  v := {
    "allow": allow,
    "violation": {
      "type": "A rule to verify the main image is from an approved source",
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

##########################################################################
# Decision Logic
##########################################################################
allow {
  count(violations) == 0
}

reason = msg {
  allow
  msg := "Main container image is from an approved source"
}
reason = msg {
  not allow
  msg := "Main container image is not from an approved source"
}

##########################################################################
# Violations
##########################################################################
# We read `metadata.component` from the SBOM (CycloneDX).
# If the main component name does not match one of the 
# approved_sources patterns, we add a single violation.
##########################################################################

violations = j {
  # If there's no mismatch, return an empty list
  some meta = input.evidence.predicate.bom.metadata
  not is_valid(meta.component.name)

  j := [{
    "component": meta.component.name
  }]
} or j := []

##########################################################################
# Helper: is_valid
##########################################################################
# is_valid returns true if 'imageName' matches at least 
# one regex pattern in 'approved_sources'.
##########################################################################
is_valid(imageName) {
  count(approved_sources) > 0

  some pattern in approved_sources
  regex.match(pattern, imageName)
}
