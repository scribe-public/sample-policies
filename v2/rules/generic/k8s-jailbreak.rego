package verify

import future.keywords.in

default allow := false

default violations := []

default asset := {}

prohibited_ids = ["KSV006", "KSV009", "KSV023"]

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "k8s jailbreak",
			"details": violations,
		},
		"asset": asset,
		"summary": [{
			"allow": allow,
			"reason": reason,
			"violations": count(violations),
		}],
	}
}

reason = v {
	v := sprintf("%d violations | %d max allowed", [count(violations), 0])
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

asset = scribe.get_asset_data(input.evidence)
