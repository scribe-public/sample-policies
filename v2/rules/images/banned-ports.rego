package verify

import future.keywords.in

default allow := false
default violations := []
default errors := []
default banned_ports := []
default metadata := {}


##########################################################################
# Retrieve Evidence Metadata
##########################################################################
# We assume the SBOM metadata is available at input.evidence.predicate.bom.metadata.
metadata := input.evidence.predicate.bom.metadata

##########################################################################
# Banned Ports List
##########################################################################
# Retrieve the banned ports list from the with block.
# Each banned port should be an object with a "port" field and optionally a "protocol" field.
banned_ports = input.config.args.banned_ports {
  input.config.args.banned_ports
}

##########################################################################
# Final Verify Object
##########################################################################
verify = result {
  result := {
    "allow": allow,
    "errors": errors,
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

##########################################################################
# Compute Found Ports
##########################################################################
found_ports = [ p.value |
  some p in metadata.component.properties;
  startswith(p.name, "imageExposedPorts_")
]

##########################################################################
# Reason for Summary
##########################################################################
reason = msg {
  allow
  msg := sprintf("No banned ports are exposed. Found ports: %v", [sprintf("%v", [found_ports])])
}
reason = msg {
  not allow
  msg := sprintf("Banned port(s) are exposed. Found ports: %v.", [sprintf("%v", [found_ports])])
}

##########################################################################
# Violations
##########################################################################
violations = [ obj |
  some p in metadata.component.properties;
  startswith(p.name, "imageExposedPorts_");
  arr = split(p.value, "/");
  count(arr) == 2;
  arr[0] = portVal;
  arr[1] = protoVal;
  some b in banned_ports;
  is_banned(portVal, protoVal, b);
  obj := {
    "component": metadata.component.name,
    "exposedPort": p.value,
    "matchBannedPort": b
  }
]

##########################################################################
# Helper: is_banned
##########################################################################
# Clause 1: When the banned record specifies a protocol.
is_banned(portVal, protoVal, banned) {
  lower(banned.port) == lower(portVal);
  banned.protocol != null;
  lower(banned.protocol) == lower(protoVal)
}

# Clause 2: When the banned record does not specify a protocol.
is_banned(portVal, protoVal, banned) {
  lower(banned.port) == lower(portVal);
  banned.protocol == null
}
