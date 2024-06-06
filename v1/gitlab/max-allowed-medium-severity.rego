package verify

import future.keywords.in

default allow := false
default violations := []

default max_allowed_medium_severity := 100 # Edit this

# Looks in the .yaml file for max
max_allowed_medium_severity := input.config.args.max_allowed_medium_severity {
    input.config.args.max_allowed_medium_severity != null
    input.config.args.max_allowed_medium_severity
}

verify = v {
    v := {
        "allow": allow,
        "violation": {
            "type": "Max allowed of medium severity vulnerabilities have been passed",
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
    count(medium_severity_list) <= max_allowed_medium_severity
}

reason = v {
    allow
    v := "Did not pass the max allowed of medium severity vulnerabilities"
}

reason = v {
    not allow
    v := "Max allowed of medium severity vulnerabilities passed"
}

medium_severity_list := [v | 
    vulnerability := input.evidence.predicate.content.vulnerabilities[_]
    vulnerability.severity == "Medium"
    v := vulnerability
]

# Violation has been switched here as a list instead of a set
violations := [r | 
    count(medium_severity_list) > max_allowed_medium_severity
    vulnerability := medium_severity_list[_]
    r := {
        "max": max_allowed_medium_severity,
        "id": vulnerability.id,
        "severity": vulnerability.severity,
        "description": vulnerability.description,
        "message": vulnerability.message,
    }
] 