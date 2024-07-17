package verify

import future.keywords.in

default allow := false

default violations := []

default author_email_regex := ""

author_email_regex = input.config.args.author_email_regex

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
	v := "author_email_regex is set as requested"
}

reason = v {
	not allow
	v := "author_email_regex is not set as requested"
}

violations = j {
	j := {r |
        project = input.evidence.predicate.content[_].project.result_object
		author_email_regex_error(project, author_email_regex)
        r = {
            "project": project.name,
        }
	}
}

author_email_regex_error(project, regex) {
	not project.push_rules
}

author_email_regex_error(project, regex) {
	project.push_rules.author_email_regex == null
}

author_email_regex_error(project, regex) {
	project.push_rules.author_email_regex != author_email_regex
}
