package verify
import future.keywords.in

default allow := false
default violations := []
default property = {
    "name": "",
    "value": "",
}

config := {
    "labels": [{"label": "org.opencontainers.image.version", "value": "22.04"}],
}

verify = v {
        v := {
        "allow": allow,
        "violations": violations,
            "summary": [{
            "allow": allow,
            "reason":  sprintf("Image doesn't contain required labels: %v", [violations]),
            "violations": count(violations),
        }]
    }
}

allow {
    count(violations) == 0
}

violations = j {
j := { r |
    some label in config.labels
    some property in input.evidence.predicate.bom.metadata.component.properties
    startswith(property.name, "label_")
    endswith(property.name, label.label)
    property.value != label.value
    r = {
            "type": "label",
            "details": {
                "label": label.label,
                "value": label.value,
            }
        }
    }
}