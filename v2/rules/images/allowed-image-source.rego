package verify

import data.scribe as scribe
import future.keywords.in

default allow := false
default violations := []
default asset := {}
default errors := []
default approved_sources := []

# Retrieve evidence (SBOM)
asset = scribe.get_asset_data(input.evidence)

# Extract main image information from metadata.component
image_name   = input.evidence.predicate.bom.metadata.component.name
image_version = input.evidence.predicate.bom.metadata.component.version

verify = v {
  v := {
    "allow": allow,
    "errors": errors,
    "violation": {
      "type": "Main Image Approved Source Check",
      "details": violations,
    },
    "asset": asset,
    "summary": [{
      "allow": allow,
      "reason": reason,
    }],
  }
}

##########################################################################
# Approved Source Patterns
##########################################################################
approved_sources = input.config.args.approved_sources {
  input.config.args.approved_sources
}

##########################################################################
# Decision Logic
##########################################################################
# The rule allows if there is at least one approved source pattern and the
# main image name matches one of those patterns.
allow {
  count(approved_sources) > 0
  is_valid(image_name)
}

##########################################################################
# Reason for Summary
##########################################################################
reason = msg {
  count(approved_sources) == 0
  msg := "Main image failed validation: no approved source patterns provided"
}
reason = msg {
  count(approved_sources) > 0
  allow
  msg := "Main image is from an approved source"
}
reason = msg {
  count(approved_sources) > 0
  not allow
  msg := "Main image is not from an approved source"
}

##########################################################################
# Violations
##########################################################################
violations = v {
  count(approved_sources) == 0
  v = [{ "component": image_name, "version": image_version, "error": "No approved source patterns provided" }]
} else = v {
  count(approved_sources) > 0
  not is_valid(image_name)
  v = [{ "component": image_name, "version": image_version }]
} else = []

##########################################################################
# Helper: is_valid
##########################################################################
# is_valid returns true if the given image name matches at least one approved pattern.
# Both the image name and approved pattern are lowercased and the pattern is anchored.
is_valid(name) {
  count(approved_sources) > 0
  some pattern in approved_sources
  regex.match(sprintf("^%v$", [lower(pattern)]), lower(name))
}
