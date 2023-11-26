package verify

import future.keywords.in

default allow := false

default violations := []

prohibited_ids = ["KSV006", "KSV009", "KSV023"]

verify = v {
	v := {
		"allow": allow,
		"violations": {
			"type": "k8s jailbreak",
			"details": violations,
		},
		"summary": [{
			"allow": allow,
			"reason": reason,
			"violations": count(violations),
		}],
	}
}

reason = v {
	allow
	v := sprintf("# of violations (%d) is under max violation limit %d", [count(violations), 0])
}

reason = v {
	not allow
	v := sprintf("# of violations (%d) exceeds max violation limit %d", [count(violations), 0])
}

allow {
	count(violations) == 0
}

violations = j {
	j := {r |
		d := base64.decode(input.evidence.predicate.content)
		k8report := json.unmarshal(d)
		namespaces = k8report.Misconfigurations
		some i
		ns = namespaces[i]
		misconfigs = ns.Results[0].Misconfigurations
		some k
		misconfig = misconfigs[k]
		some id in prohibited_ids
		misconfig.ID == id
		r := {"id": misconfig.ID}
	}
}
