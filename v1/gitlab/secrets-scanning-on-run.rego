package verify

import future.keywords.in

default allow := false

default violations := []

verify = v {

    v := {
        "allow" : allow,
        "violation" : {
            "type" : "Not allowed to share secrets",
            "details" : violations,
        },
        "summary" : [{
            "allow" : allow,
            "reason" : reason,
            "violations" : count(violations),
        }],
    }
}

# Define exact secret names to search
known_secrets_to_search := {
    "secret",
    "secrets",
    "SECRET",
    "SECRETS",
}

# Define a set of all secret variations
secret_variations := {
  "secret",
  "secrets",
  "SECRET",
  "SECRETS",
  "Secret",
  "Secrets",
}

allow {
    count(violations) == 0
}

reason = v {
    allow
    v := "No secrets are exported"
}

reason = v {
    not allow
    v := "At least one secret has been exported"
}



# violations = j {
#     j := {r | 
#         some project in input # unsure if there can be multiple projects in the json
#         some variable in project.variable
#         variable.scribe_type == "variable"
#         # gotta make this an or condition
#         contains_secret(variable.name, secret_variations)
#         contains_secret(variable.id, secret_variations)
#         # or end
#         not match_any(variable.name)
#         r = {
#             "name" : variable.name,
#             "id" : variable.id,
#         }
#     }
# }

# violation if there were no secret scanning on run
violations = j {
    j := {r | 
        some project in input
        some pipeline in project.pipeline
        some job in pipeline.result_object.jobs
        job.scribe_type == "job" # probz useless
        not 

    }
}


contains_secret = (str string, secrets list[string]) {
  str =~ (rx"^" + concat(secrets, "|") + "$")
}

match_any(required_secret) {
    allowed_sectret_list := input.config.args.allowed_sectret_list
	some allowed_secret in allowed_sectret_list
	allowed_secret == required_secret
}
