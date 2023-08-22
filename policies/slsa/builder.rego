package verify

default allow = false
default msg := "Builder mismatch"

verify = v {
        v := {
        "allow": allow,
            "summary": [{
            "allow": allow,
            "reason":  msg,
        }]
    }
}

allow {
    input.evidence.predicate.runDetails.builder.id == input.config.args.id
}

msg = "Builder matches config" { allow }