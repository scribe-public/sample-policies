package verify
import future.keywords.if

default allow := false
default cmd := ""

verify = v {
    v := {
        "allow": allow,
        "summary": [{
            "allow": allow,
            "reason": sprintf("Image entrypoint allows shell access: %s", [cmd])
        }]
    }
}

cmd = input.evidence.predicate.bom.metadata.component.properties[i]["value"] {
    input.evidence.predicate.bom.metadata.component.properties[i]["name"] == "entrypoint"
}

allow {
    not contains(cmd, "sh")
}

allow {
    contains(cmd, ".sh")
}