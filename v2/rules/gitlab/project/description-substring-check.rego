package verify

import future.keywords.in
import data.scribe as scribe

default allow := false
default violations := []
default asset := {}

asset = scribe.get_asset_data(input.evidence)

# default pattern := "(?i)"

# Gets from yaml file
pattern := input.config.args.pattern {
    input.config.args.pattern != null
    input.config.args.pattern
}


verify = v {
    v := {
        "allow": allow,
        "violation": {
            "type": "Verify that a substring is not found in the description attribute of the vulnerabilities",
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
    v := "No pattern has been matched in the description"
}

reason = v {
    not allow
    v := "At least one of the pattern has been matched in the description"
}


# Violation has been switched here as a list instead of a set
violations := [r |
    vulnerability := input.evidence.predicate.content.vulnerabilities[_]
    contains_keywords(vulnerability.description)
    r := {
        "id": vulnerability.id,
        "severity": vulnerability.severity,
        "description": vulnerability.description,
        "message": vulnerability.message,
        "pattern": pattern,
        "search": "description"
    }
]

contains_keywords(input_string) {
    regex.match(pattern, input_string)
}
