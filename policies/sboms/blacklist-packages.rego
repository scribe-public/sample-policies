package verify
default allow = false
default violations = []

verify = v {
v := {
    "allow": allow,
    "reason": "Risky packages.",
    "details": json.marshal(violations),
    "violations": count(violations)
}
}

allow {
    count(violations)  <=  input.config.args.blacklisted_limit
}

violations = j {
j := { r |
        some i,k 
        components := input.evidence.predicate.bom.components
        p := components[i].purl
        b := input.config.args.blacklist[k]
        contains(p,b)
        r := {
            "type":"banned package",
            "package":b
        }
    }
}