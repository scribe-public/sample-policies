package verify

default allow = false
default violations = []
default msg := "Some packages use blacklisted licenses"

verify = v {
        v := {
        "allow": allow,
        "violations": violations,
            "summary": [{
            "allow": allow,
            "reason":  msg,
            "violations": count(violations),
        }]
    }
}

allow {
    count(violations)  < input.config.args.blacklisted_limit
}

msg = "No packages use blacklisted licenses" { allow }

violations = j {
j := { r |
        components := input.evidence.predicate.bom.components
        some i 
        comp := components[i]
        comp.licenses != null
        some j
        l := comp[licenses][j]
        some k
        b := input.config.args.blacklist[k]
        lname := l.license.name
        startswith(lname, b)
        r = {
            "type":"license",
            "details": {
            "package":comp.purl,
            "license":b
            }
        }
    }
}