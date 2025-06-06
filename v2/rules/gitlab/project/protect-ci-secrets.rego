package verify

import future.keywords.in
import data.scribe as scribe

default allow := false
default violations := []
default pattern := "(?i)(token|secret)"
default asset := {}

asset = scribe.get_asset_data(input.evidence)

pattern = input.config.args.pattern {
    input.config.args.pattern
}

verify = v {
    v := {
        "allow": allow,
        "violation": {
            "type": "secret has been shared", 
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
    v := "All variables are protected" 
}

reason = v {
    not allow
    v := "At least one variable is not protected" 
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
