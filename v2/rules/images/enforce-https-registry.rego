package verify

import future.keywords.in

default allow := false
default violations := []
default reason := "Registry scheme is not HTTPS."
default asset  := {}

asset = scribe.get_asset_data(input.evidence)

##########################################################################
# Retrieve the Container Component
##########################################################################
component = input.evidence.predicate.bom.metadata.component

##########################################################################
# Check If Registry Scheme Is HTTPS
##########################################################################
allow {
  some prop in component.properties
  prop.name == "registry_scheme"
  prop.value == "https"
}

##########################################################################
# Reason for Summary
##########################################################################
reason = msg {
  allow
  msg := "Registry scheme is HTTPS."
}
reason = msg {
  not allow
  msg := "Registry scheme is not HTTPS."
}

##########################################################################
# Violations
##########################################################################
violations = v {
  not allow
  v = [{
    "error": "Registry connection is not over HTTPS (registry_scheme != 'https')."
  }]
} else = v {
  v = []
}

##########################################################################
# Final Verify Object
##########################################################################
verify = output {
  output := {
    "allow": allow,
    "violation": {
      "type": "RegistryHTTPSCheck",
      "details": violations
    },
    "asset": asset,
    "summary": [{
      "allow": allow,
      "reason": reason
    }]
  }
}
