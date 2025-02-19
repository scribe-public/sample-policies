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
      "type": "BannedPorts",
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
  msg := "No banned ports are exposed."
}
reason = msg {
  not allow
  msg := "Banned port(s) are exposed."
}

##########################################################################
# Violations
##########################################################################
# We look for properties that match "imageExposedPorts_.*" (e.g. "imageExposedPorts_0"), 
# then parse the string (e.g. "3000/tcp"). If the port/protocol is in the banned list, 
# we record a violation.
##########################################################################
violations = results {
  results := [
    {
      "component": meta.component.name,
      "exposedPort": prop.value,
      "matchBannedPort": banned
    }
    |
    some meta = input.evidence.predicate.bom.metadata
    some prop in meta.component.properties
    startswith(prop.name, "imageExposedPorts_")

    # Extract port/protocol from strings like "3000/tcp"
    splitted := split(prop.value, "/")
    count(splitted) == 2  # Expect [ "3000", "tcp" ]
    portVal := splitted[0]
    protoVal := splitted[1]

    # Compare extracted port + protocol to the banned list
    some banned in input.config.args.banned_ports
    is_banned(portVal, protoVal, banned)
  ]
} or results := []

##########################################################################
# is_banned
##########################################################################
# This function compares the exposed port + protocol to a single "banned" record, 
# which might specify "port", "protocol", or both. 
# If "protocol" is absent, any protocol for that port is considered banned.
##########################################################################
is_banned(portVal, protoVal, banned) {
  banned.port == portVal
  banned.protocol == protoVal
} or {
  banned.port == portVal
  not banned.protocol  # If no protocol is specified, ban all protocols for that port
}
