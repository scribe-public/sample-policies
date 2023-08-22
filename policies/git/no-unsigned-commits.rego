package verify
import future.keywords.if

default allow = false
default violations = []
default signature := ""
default msg := "Some commits are unsigned"

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
    count(violations) == 0
}

msg = "All commits are signed" { allow }

violations = j {
j := { r |
    some i, k
    components := input.evidence.predicate.bom.components
    comp := components[i]
    prop := comp.properties[k]
    prop.name == "PGPSignature"
    prop.value == ""
    r = {
        "type":"missing signature",
        "details": {
            "commit":comp.name,
        }
    }
}
}