package verify

default allow = false

verify = v {
        v := {
        "allow": allow,
            "summary": [{
            "allow": allow,
            "reason":  "Builder mismatch",
        }]
    }
}

allow {
    input.evidence.predicate.runDetails.builder.id == input.config.args.id
}