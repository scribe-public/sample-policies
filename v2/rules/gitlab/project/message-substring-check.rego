package verify

import future.keywords.in

default allow := false
default violations := []
default pattern := "(?i)()"


# Gets from yaml file
pattern := input.config.args.pattern {
    input.config.args.pattern != null
    input.config.args.pattern
}

verify = v {
    v := {
        "allow": allow,
        "violation": {
            "type": "Verify that a substring is not found in the message attribute of the vulnerabilities",
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
    v := "No pattern has been matched in the messages"
}

reason = v {
    not allow
    v := "At least one of the pattern has been matched"
}


# Violation has been switched here as a list instead of a set
violations := [r |
    vulnerability := input.evidence.predicate.content.vulnerabilities[_]
    contains_keywords(vulnerability.message)
    
    r := {
        "id": vulnerability.id,
        "severity": vulnerability.severity,
        "description": vulnerability.description,
        "message": vulnerability.message,
        "pattern": pattern,
        "search": "message"
    }
]

contains_keywords(input_string) {
    regex.match(pattern, input_string)
}
