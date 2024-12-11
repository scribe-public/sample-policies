package verify

import data.superset.policy as policy

default allow = false

default asset := {}

allow = policy.published.allow

errors = policy.published.errors

violation = policy.published.violation

summary = policy.published.summary

asset = scribe.get_asset_data(input.evidence)

verify = v {
	v := {
		"allow": allow,
		"violation": violation,
		"summary": summary,
		"asset": asset,
		"errors": errors,
	}
}
