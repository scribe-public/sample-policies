package verify

import future.keywords.in
import data.scribe as scribe

default allow := false
default violations := []
default max_allowed_vulnerability_count := 0 
default asset := {}

asset = scribe.get_asset_data(input.evidence)

# Looks in the .yaml file for max
max_allowed_vulnerability_count := input.config.args.max_allowed_vulnerability_count {
    input.config.args.max_allowed_vulnerability_count != null
    input.config.args.max_allowed_vulnerability_count
}

severity := "Critical"

verify = v {
    v := {
        "allow": allow,
        "violation": {
            "type": "Max allowed of critical severity vulnerabilities have been passed",
            "details": violations,
        },
		"asset": asset,
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
