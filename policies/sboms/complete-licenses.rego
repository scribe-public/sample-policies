package verify

default allow = false
default violations = []

verify = v {
        v := {
        "allow": allow,
        "violations": violations,
            "summary": [{
            "allow": allow,
            "reason":  "Not all packages have licenses",
            "details": json.marshal(violations),
            "violations": count(violations),
        }]
    }
}

allow {
    count(violations) == 0
}

violations = j {
j := { r |
        components := input.evidence.predicate.bom.components
        some i 
        comp := components[i]
        comp.licenses != null
        r = {
            "type":"license",
            "details": {
            "package":comp.purl,
            }
        }
    }
}