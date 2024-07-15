package verify

import future.keywords.in

default allow := false

default violations := []

default name = "All Members"

default approvals_required_min := 1

name = input.config.args.name

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "admins",
			"details": violations,
		},
		"summary": [{
			"allow": allow,
			"reason": reason,
			"violations": count(violations),
		}],
	}
}

allow {
	count(violations) == 0
}

reason = v {
	allow
	v := "merge_request_approval rules meet the requirements"
}

reason = v {
	not allow
	v := "merge_request_approval rules do not meet the requirements"
}

violations = j {
	j := {r |
        project = input.evidence.predicate.content[_].project.result_object
		project.merge_request_approval_rules != null
		r = merge_request_approval_error(project)
	}
}

match_any(project, name) {
    some rule in project.merge_request_approval_rules
	rule.name == name
}

merge_request_approval_error(project) = v {
	project.merge_request_approval_rules == null
	v = {
		"project": project.name,
	}
}

merge_request_approval_error(project) = v {
	not match_any(project, name)
	v = {
		"project": project.name,
		"available_rules": project.merge_request_approval_rules,
	}
}

merge_request_approval_error(project) = v {
	some rule in project.merge_request_approval_rules
	rule.name == name
	rule.approvals_required < approvals_required_min
	v = {
		"project": project.name,
		"rule": rule.name,
		"approvals_required": rule.approvals_required,
		"approvals_required_min": approvals_required_min,
	}
}