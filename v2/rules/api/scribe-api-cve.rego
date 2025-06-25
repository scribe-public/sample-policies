package verify

import data.superset.policy as policy

default allow = false
default errors = []
default violation = {}
default summary = []

allow = policy.cve.allow
errors = policy.cve.errors
violation = policy.cve.violation
summary = policy.cve.summary

verify = v {
	v := {
		"allow": allow,
		"violation": violation,
		"summary": summary,
		"errors": errors,
	}
}
