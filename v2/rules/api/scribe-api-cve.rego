package verify

import data.superset.policy as policy
import data.scribe as scribe

default allow = false
default errors = []
default violation = {}
default summary = []
default asset = {}

allow = policy.cve.allow
errors = policy.cve.errors
violation = policy.cve.violation
summary = policy.cve.summary
asset = scribe.get_asset_data(input.evidence)

verify = v {
	v := {
		"allow": allow,
		"asset": asset,
		"violation": violation,
		"summary": summary,
		"errors": errors,
	}
}
