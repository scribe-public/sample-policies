package verify

import data.superset.policy as policy

default allow = false

allow = policy.cve.allow
# allow = policy.images.allow
# allow = policy.licences.allow
# allow = policy.unmaintained.allow

errors = policy.cve.errors
# errors = policy.images.errors
# errors = policy.licences.errors
# errors = policy.unmaintained.errors,

violation = policy.cve.violation
# violation = policy.images.violation
# violation = policy.licences.violation
# violation = policy.unmaintained.violation

summary = policy.cve.summary
# summary = policy.images.summary
# summary = policy.licences.summary
# summary = policy.unmaintained.summary

verify = v {
	v := {
		"allow": allow,
		"violation": violation,
		"summary": summary,
		"errors": errors,
	}
}