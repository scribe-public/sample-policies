package verify

import future.keywords.in

default allow := false
default violations := []

# Define the regular expression pattern to match "token" or "secret" in any case
default pattern := "(?i)(token|secret)"

pattern = input.config.args.pattern {
    input.config.args.pattern
}

verify = v {
    v := {
        "allow": allow,
        "violation": {
            "type": "secret has been shared", # Edit this
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
    v := "All variables are protected" # Edit this
}

reason = v {
    not allow
    v := "At least one variable is not protected" # Edit this
}

violations := {r |
    some variable in input.evidence.predicate.content[_].variable
    variable.result_object.masked == false
    contains_keywords(variable.name)
    r := {
        "variable_name": variable.name,
        "masked": variable.result_object.masked,
        "type": variable.result_object.type
    }
}

# Function to check if the pattern is included in the input string
contains_keywords(input_string) {
    regex.match(pattern, input_string)
}
