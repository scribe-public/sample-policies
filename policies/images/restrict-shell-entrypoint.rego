package verify

import future.keywords.if

default allow := false

default cmd := ""

verify = v if {
	v := {
		"allow": allow,
		"violation": {
			"type": "Allowed shell access",
			"details": [{"cmd": cmd}],
		},
		"summary": [{
			"allow": allow,
			"reason": reason,
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

reason = v if {
	allow
	v := "image entrypoint does not allow shell access"
}

reason = v if {
	not allow
	v := "image entrypoint allows shell access"
}
