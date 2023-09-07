package verify
import future.keywords.in

default allow := false
default violations := []
default msg := "The build misses some of the expected byproducts"

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

msg = "The build contains all the expected byproducts" { allow }

violations = j {
j := { r |
    some bp in input.config.args.byproducts
    some byproduct in input.evidence.predicate.runDetails.byproducts
    not byproduct_match(byproduct, bp)
    r = {
            "type": "byproduct",
            "details": {
                "missing": bp,
            }
        }
    }
}

byproduct_match(byproduct, bp) {
    contains(byproduct.uri, bp)
}

byproduct_match(byproduct, bp) {
    contains(byproduct.digest[_], bp)
}

byproduct_match(byproduct, bp) {
    contains(byproduct.content, bp)
}