package verify
import future.keywords.in

default allow := false
default violations := []
default property = {
    "name": "",
    "value": "",
}

verify = v {
        v := {
        "allow": allow,
        "violations": violations,
            "summary": [{
            "allow": allow,
            "reason":  sprintf("Image build commands used blacklisted scripts: %v", [violations]),
            "violations": count(violations),
        }]
    }
}

allow {
    count(violations) == 0
}

violations = j {
j := { r |
    some blacklisted in input.config.args.blacklist
    some component in input.evidence.predicate.bom.components
    some property in component.properties
    property.name == "CreatedBy"
    contains(property.value, blacklisted)
    r = {
            "type": "blacklisted-script",
            "details": {
                "name": property.value,
            }
        }
    }
}