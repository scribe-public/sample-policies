package verify

import future.keywords.in

##########################################################################
# Defaults
##########################################################################
default allow := false
default violations := []

##########################################################################
# Final Verify Object
##########################################################################
verify = v {
  v := {
    "allow": allow,
    "violation": {
      "type": "MissingHealthcheck",
      "details": violations
    },
    "summary": [{
      "allow": allow,
      "reason": reason,
      "violations": count(violations)
    }]
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
  msg := "The image includes at least one healthcheck property."
}
reason = msg {
  not allow
  msg := "No Docker HEALTHCHECK property found in the image."
}

##########################################################################
# Violations
##########################################################################
# If no property "imageHealthcheck_<i>" is found, we produce a single
# violation explaining that the container lacks a HEALTHCHECK.
##########################################################################
violations = v {
  not has_healthcheck
  v := [
    {
      "reason": "Missing Dockerfile HEALTHCHECK instruction (no imageHealthcheck_ property)"
    }
  ]
} or v := []

##########################################################################
# has_healthcheck
##########################################################################
# Returns 'true' if there's at least one property named "imageHealthcheck_<i>"
# in the container's SBOM metadata.
##########################################################################
has_healthcheck {
  some meta = input.evidence.predicate.bom.metadata
  some prop in meta.component.properties
  startswith(prop.name, "imageHealthcheck_")
}
