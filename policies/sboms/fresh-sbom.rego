package verify
default allow = false
default exceeding = 0

import future.keywords.if

config := {
    "max_days" : 30
}


verify = v {
    v := {
        "allow": allow,
        "summary": [{
        "allow": allow,
        "reason":  "SBOM is too old",
        "exceeding": exceeding,
        }]
    }
}

nanosecs_per_second = 1000 * 1000 * 1000
nanosecs_per_day = 24 * 60 * 60 * nanosecs_per_second
maximum_age = config.max_days * nanosecs_per_day

timestamp = time.parse_rfc3339_ns(input.evidence.predicate.bom.metadata.timestamp)
exceeding = time.now_ns() - (timestamp + maximum_age)

allow {
    exceeding <= 0
}

errors[msg] {
    not input.evidence.predicate.bom.metadata.timestamp
    msg := "bom timestamp not presented"
}