package verify
import future.keywords.if

default allow := false
default cmd := ""
default msg := "Image entrypoint allows shell access"

verify = v {
    v := {
        "allow": allow,
        "summary": [{
            "allow": allow,
            "reason": sprintf("%s: %s", [msg, cmd])
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

msg = "Image entrypoint does not allow shell access" { allow }