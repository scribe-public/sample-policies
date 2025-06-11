package verify
import data.scribe as scribe

import future.keywords.in

default allow := false
default violations := []
default reason := "Evidence is not in CycloneDX attest-cyclonedx-json format"
default asset := {}
default env := {}
default image_name := ""
default skip_image := false

asset = scribe.get_asset_data(input.evidence)

##########################################################################
# Retrieve Evidence
##########################################################################
# We assume your SBOM environment field has "content_type",
# e.g. env.content_type == "attest-cyclonedx-json"
env = input.evidence.predicate.environment

# If we also want to skip based on the container image name:
image_name = input.evidence.predicate.bom.metadata.component.name

##########################################################################
# Skip Logic
##########################################################################
skip_image {
  some pattern in input.config.args.skip_image_regex
  regex.match(pattern, image_name)
}

##########################################################################
# Decision Logic
##########################################################################
# We'll have OR logic for "allow":
# 1) skip_image => trivially allow
# 2) not skip_image => require env.content_type == "attest-cyclonedx-json"

allow {
  skip_image
}

allow {
  not skip_image
  env.content_type == "attest-cyclonedx-json"
}

##########################################################################
# Reason for Summary
##########################################################################
# We'll define reasons in small rules for each path. Rego merges them with OR.

reason = r {
  skip_image
  r := sprintf("Skipping image '%v' based on skip_image_regex", [image_name])
}

reason = r {
  not skip_image
  env.content_type == "attest-cyclonedx-json"
  r := "Evidence is properly signed (CycloneDX attest-cyclonedx-json)"
}

reason = r {
  not skip_image
  env.content_type != "attest-cyclonedx-json"
  r := "Evidence is not a signed evidence"
}

##########################################################################
# Violations
##########################################################################
violations = v {
  not allow
  v = [{
    "error": "CycloneDX attest-cyclonedx-json format required, but not found (and no skip)"
  }]
} else = v {
  v = []
}

##########################################################################
# Final Verify Object
##########################################################################
verify = result {
  result := {
    "allow": allow,
    "violation": {
      "type": "RequireCycloneDXAttest",
      "details": violations
    },
    "asset": asset,
    "summary": [{
      "allow": allow,
      "reason": reason
    }],
    "image_name": image_name
  }
}
