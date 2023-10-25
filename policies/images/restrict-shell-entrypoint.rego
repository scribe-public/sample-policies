package verify

import future.keywords.if

default allow := false

default cmd := ""

default msg := "Image entrypoint allows shell access"

verify = v if {
	v := {
		"allow": allow,
		"summary": [{
			"allow": allow,
			"reason": sprintf("%s: %s", [msg, cmd]),
		}],
	}
}

cmd = input.evidence.predicate.bom.metadata.component.properties[i].value if {
	input.evidence.predicate.bom.metadata.component.properties[i].name == "entrypoint"
}

allow if {
	not contains(cmd, "sh")
}

allow if {
	contains(cmd, ".sh")
}

msg = "Image entrypoint does not allow shell access" if allow
