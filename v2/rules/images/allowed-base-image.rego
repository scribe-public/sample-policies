package verify

import data.scribe as scribe
import future.keywords.in  # Allows 'in' keyword usage if needed

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
# If 'approved_sources' is passed via the 'with:' block in your rule config, 
# store it here for use in is_valid() checks. 
approved_sources = input.config.args.approved_sources {
  input.config.args.approved_sources
}

##########################################################################
# Main Verify Object
##########################################################################
# This is the final output structure for Valint (or your OPA-based tool).
verify = v {
  v := {
    "allow": allow,
    "violation": {
      "type": "A rule to verify base images are from an approved source",
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

# allow is true if no violations are found
allow {
  count(violations) == 0
}

# reason string for summary
reason = msg {
  allow
  msg := "Base images are from an approved source"
}
reason = msg {
  not allow
  msg := "Base image is not from an approved source"
}

##########################################################################
# Violations
##########################################################################
# Collect any base image that does not match one of the approved sources.
# We look for components with property.name == "IsBaseImage" and 
# property.value == "true".
##########################################################################
violations = j {
  j := [
    {
      "version": component.version,
      "base-image": component.name
      # Potentially store entire component object if needed
      # "component": component
    }
    |
    some component in input.evidence.predicate.bom.components
    component.group == "container"

    some property in component.properties
    property.name == "IsBaseImage"
    property.value == "true"

    not is_valid(component.name)
  ]
}

##########################################################################
# is_valid
##########################################################################
# is_valid() checks if the given image name matches at least 
# one of the patterns in 'approved_sources'.
##########################################################################
is_valid(image) {
  # Ensure there's at least one approved_sources pattern
  count(approved_sources) > 0

  # For each pattern in approved_sources, we do a regex match. 
  some pattern in approved_sources
  regex.match(pattern, image)
}
