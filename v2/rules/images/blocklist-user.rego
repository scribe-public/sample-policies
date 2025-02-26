package verify

import future.keywords.in

# By default, disallow (allow = false) if any violations exist.
default allow := false
default violations := []
default asset := {}

asset = scribe.get_asset_data(input.evidence)

# Optional fallback for 'user' (not strictly used in logic below).
default user := "root"

# An example property structure, not strictly required for logic.
default property = {
  "name": "",
  "value": "",
}

verify = v {
  v := {
    "allow": allow,
    "violation": {
      "type": "Missing Labels",  # Kept from the original draft, can rename if desired
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

# Rule passes if there are no violations
allow {
  count(violations) == 0
}

# The reason string for the summary
reason = msg {
  allow
  msg := "Image USER is *not* on the blocklist"
}
reason = msg {
  not allow
  msg := "Image USER is on the blocklist"
}

# violations:
#   We look at the SBOM's 'metadata.component.properties' for property.name == "user".
#   If 'property.value' matches any user in the config's 'users' array, 
#   that triggers a violation. We record each such user in 'violations'.
violations = j {
  j := {r |
    some property in input.evidence.predicate.bom.metadata.component.properties
    property.name == "user"
    some user in input.config.args.users
    property.value == user

    r = {
      "user": user
    }
  }
}
