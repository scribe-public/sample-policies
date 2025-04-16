package verify

import future.keywords.in
import data.scribe as scribe

default allow := false
default asset := {}
default reason := "No blocklist violations detected."
default violations_threshold := 0

# Retrieve evidence (SARIF report) using our scribe helper
asset = scribe.get_asset_data(input.evidence)

# Override default threshold if provided
violations_threshold = input.config.args.violations_threshold

##########################################################################
# Final Verify Object
##########################################################################
verify = result {
  result := {
    "allow": allow,
    "violation": {
      "type": "BlocklistViolation",
      "details": violations,
    },
    "asset": asset,
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
  count(violations) <= violations_threshold
}

##########################################################################
# Reason for Summary
##########################################################################
reason = msg {
  allow
  msg := "All SARIF blocklist findings are within the acceptable threshold."
}
reason = msg {
  not allow
  msg := sprintf("%d blocklist findings exceed the threshold of %d.", [count(violations), violations_threshold])
}

##########################################################################
# Evaluate and Deduplicate Violations
##########################################################################
violations = [ violation |
  some rule_id in input.config.args.rule_ids
  run := input.evidence.predicate.content.runs[_].results[_]
  rule_def := input.evidence.predicate.content.runs[0].tool.driver.rules[run.ruleIndex]
  contains(run.ruleId, rule_id)
  violation := {
    "rule": rule_def.id,
    "severity": to_number(rule_def.properties["security-severity"]),
    "location": run.locations[0].physicalLocation.artifactLocation.uri,
  }
]
