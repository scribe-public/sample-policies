package verify
import future.keywords.in
default allow = false
default violations = []
default b = ""

verify = v {
v := {
    "allow": allow,
    "reason": "Required packages.",
    "details": json.marshal(violations),
    "violations": count(violations)
}
}

allow {
    count(violations)  <=  input.config.args.violations_limit
}

violations = j {
j := { r |
        some k
        b := input.config.args.required_pkgs[k]
        not any_match(b)
        r := {
            "type":"missing required package",
            "package":b
        }
    }
}

any_match(b) {
    some component in input.evidence.predicate.bom.components
    p := component.purl
    contains(p,b)
}