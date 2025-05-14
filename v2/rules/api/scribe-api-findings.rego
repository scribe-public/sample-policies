package verify

import data.superset.policy as policy
import data.scribe as scribe

default allow = false
default errors = []
default violation = {}
default summary = []
default asset = {}

allow = policy.findings.allow
errors = policy.findings.errors
violation = policy.findings.violation
summary = policy.findings.summary

verify = v {
	v := {
		"allow": allow,
		"violation": violation,
		"summary": summary,
		"errors": errors,
	}
}
