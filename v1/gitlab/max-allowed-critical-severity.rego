package verify

import future.keywords.in

default allow := false
default violations := []

default max_allowed_vulnerability_count := 0 # Edit this

# Looks in the .yaml file for max
max_allowed_vulnerability_count := input.config.args.max_allowed_vulnerability_count {
    input.config.args.max_allowed_vulnerability_count != null
    input.config.args.max_allowed_vulnerability_count
}

default severity := "Critical"

# Looks in the .yaml file for severity
severity := input.config.args.severity {
    input.config.args.severity != null
    input.config.args.severity
}

verify = v {
    v := {
        "allow": allow,
        "violation": {
            "type": "Max allowed of critical severity vulnerabilities have been passed",
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
    v := "Did not pass the max allowed of critical severity vulnerabilities"
}

reason = v {
    not allow
    v := "Max allowed of critical severity vulnerabilities passed"
}

critical_severity_list := [v | 
    vulnerability := input.evidence.predicate.content.vulnerabilities[_]
    vulnerability.severity == severity
    v := vulnerability
]

# Violation has been switched here as a list instead of a set
violations := [r | 
    count(critical_severity_list) > max_allowed_vulnerability_count
    vulnerability := critical_severity_list[_]
    r := {
        "id": vulnerability.id,
        "severity": vulnerability.severity,
        "description": vulnerability.description,
        "message": vulnerability.message,
    }
] 