package verify

import future.keywords.in

default allow := false
default violations := []
default errors := []
default approved_sources := []

# Retrieve evidence (SBOM)

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
  msg := sprintf("Main image '%v' (version: %v) failed validation: no approved source patterns provided", [image_name, image_version])
}
reason = msg {
  count(approved_sources) > 0
  allow
  msg := sprintf("Main image '%v' (version: %v) is from an approved source", [image_name, image_version])
}
reason = msg {
  count(approved_sources) > 0
  not allow
  msg := sprintf("Main image '%v' (version: %v) is not from an approved source", [image_name, image_version])
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
