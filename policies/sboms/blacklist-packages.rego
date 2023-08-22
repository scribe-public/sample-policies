package verify

default allow = false
default violations = []
default msg := "Some blacklisted packages were found in the project"

verify = v {
    v := {
        "allow": allow,
        "violations": count(violations),
        "summary": [{
                "allow": allow,
                "reason":  msg,
                "details": json.marshal(violations),
                "violations": count(violations),
            }]
    }
}

allow {
    count(violations)  <=  input.config.args.blacklisted_limit
}

msg = "No blacklisted packages were found in the project" { allow }

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