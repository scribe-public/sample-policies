package verify

import data.superset.policy as policy

default allow = false

allow = policy.published.allow

errors = policy.published.errors

violation = policy.published.violation

summary = policy.published.summary

verify = v {
	v := {
		"allow": allow,
		"violation": violation,
		"summary": summary,
		"errors": errors,
	}
}