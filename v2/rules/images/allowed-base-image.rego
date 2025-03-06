package verify

import data.scribe as scribe
import future.keywords.in

default allow := false
default asset := {}
default errors := []

# Retrieve evidence (SBOM)
asset = scribe.get_asset_data(input.evidence)

##########################################################################
# Approved Source Patterns
##########################################################################
approved_sources = input.config.args.approved_sources {
  input.config.args.approved_sources
}

##########################################################################
# Base Image Detection
##########################################################################
# A base image component is defined as a component in group "container" that
# has any property whose name ends with "isbaseimage" (case-insensitive)
# and whose value is "true".
found_base_image {
  some c in input.evidence.predicate.bom.components
  c.group == "container"
  some p in c.properties
  endswith(lower(p.name), "isbaseimage")
  lower(p.value) == "true"
}

##########################################################################
# Valid Base Images (as list of maps with name and version)
##########################################################################
valid_base_images = [ { "name": c.name, "version": c.version } |
    some c in input.evidence.predicate.bom.components
    c.group == "container"
    some p in c.properties
    endswith(lower(p.name), "isbaseimage")
    lower(p.value) == "true"
    is_valid(c.name)
]

##########################################################################
# Invalid Base Images (as list of maps with name and version)
##########################################################################
invalid_base_images = [ { "name": c.name, "version": c.version } |
    some c in input.evidence.predicate.bom.components
    c.group == "container"
    some p in c.properties
    endswith(lower(p.name), "isbaseimage")
    lower(p.value) == "true"
    not is_valid(c.name)
]

##########################################################################
# Violations
##########################################################################
# If a base image is found, then violations is the list of invalid base images.
# Otherwise, return an array with a single error object.
violations = v {
    found_base_image
    v = invalid_base_images
} else = v {
    not found_base_image
    v = [{ "error": "No base image data found." }]
}

##########################################################################
# Decision Logic
##########################################################################
allow {
  found_base_image
  count(invalid_base_images) == 0
}

##########################################################################
# Reason for Summary
##########################################################################
reason = msg {
    not found_base_image
    msg := "Base image component not found."
}
reason = msg {
    found_base_image
    not allow
    msg := sprintf("The following base images are not from an approved source: %v", [sprintf("%v", [invalid_base_images])])
}
reason = msg {
    found_base_image
    allow
    msg := sprintf("All base images (%v) are from an approved source.", [sprintf("%v", [valid_base_images])])
}

##########################################################################
# Final Verify Object
##########################################################################
verify = result {
  result := {
    "allow": allow,
    "errors": errors,
    "violation": {
      "type": "Approved Base Image Check",
      "details": violations
    },
    "asset": asset,
    "summary": [{
      "allow": allow,
      "reason": reason,
      "violations": count(invalid_base_images)
    }]
  }
}

is_valid(image) {
  count(approved_sources) > 0
  some pattern in approved_sources
  regex.match(sprintf("^%v$", [lower(pattern)]), lower(image))
}
