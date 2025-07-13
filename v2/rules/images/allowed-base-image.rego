package verify

import data.scribe as scribe
import future.keywords.in

default allow := false
default asset := {}
default errors := []
default approved_sources := []
default found_claim_base_image := false
default found_base_image := false
default invalid_component_base_images := []
default invalid_base_images := []
default violations := []
default context_base_image_version := "unknown"

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

found_claim_base_image {
    found_base_image
} else {
  input.evidence.predicate.environment.base_image_name != null
  input.evidence.predicate.environment.base_image_name != ""
}

context_base_image_version = input.evidence.predicate.environment.base_image_version {
  input.evidence.predicate.environment.base_image_version != null
  input.evidence.predicate.environment.base_image_version != ""
} else = "unknown"

##########################################################################
# Invalid Base Images (as list of maps with name and version)
##########################################################################
invalid_component_base_images = [ { "name": c.name, "version": c.version} |
    some c in input.evidence.predicate.bom.components
    c.group == "container"
    some p in c.properties
    endswith(lower(p.name), "isbaseimage")
    lower(p.value) == "true"
    not is_valid(c.name)
]

invalid_base_images = array.concat(
    invalid_component_base_images,
    [ { "name": input.evidence.predicate.environment.base_image_name, "version": context_base_image_version } ]
) {
    not found_base_image
    found_claim_base_image
    not is_valid(input.evidence.predicate.environment.base_image_name)
} else = invalid_component_base_images

##########################################################################
# Violations
##########################################################################
# If a base image is found, then violations is the list of invalid base images.
# Otherwise, return an array with a single error object.
violations = v {
    found_claim_base_image
    v = invalid_base_images
} else = v {
    not found_claim_base_image
    v = [{ "error": "No base image data found." }]
}

##########################################################################
# Decision Logic
##########################################################################
allow {
  found_claim_base_image
  count(invalid_base_images) == 0
}

##########################################################################
# Reason for Summary
##########################################################################
reason = msg {
    not found_claim_base_image
    msg := "Base image component not found"
} else = msg {
    found_claim_base_image
    not allow
    msg := "Some of the base images are not from an approved source"
} else = msg {
    found_claim_base_image
    allow
    msg := "All base images are from an approved source"
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
  startswith(lower(image), lower(pattern))
} else {
  lower(image) == "scratch"  # Allow "scratch" as a valid base image
}
