package verify

import future.keywords.in

default allow := false
default violations := []
default cwe_value := "" 


# Looks in the .yaml file for max
cwe_value := input.config.args.cwe_value {
    input.config.args.cwe_value != null
    input.config.args.cwe_value
}


verify = v {
    v := {
        "allow": allow,
        "violation": {
            "type": "Verify that no specific CWEs are detected",
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
    v := "No specified CWEs detected"
}

reason = v {
    not allow
    v := "At least one specified CWE detected"
}


# Violation has been switched here as a list instead of a set
violations := [r | 
    
    vulnerability := input.evidence.predicate.content.vulnerabilities[_]
    identifier := vulnerability.identifiers[_]
    identifier.type == "cwe"
    identifier.value == cwe_value
    r := {
        "id": vulnerability.id,
        "severity": vulnerability.severity,
        "description": vulnerability.description,
        "message": vulnerability.message,
        "identifier": {
              "type": identifier.type,
              "name": identifier.name,
              "value": identifier.value,
              "url": identifier.url,
        },
    }
]
