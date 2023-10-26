package verify

import future.keywords.in

default allow := false

default created_str := "unknown"

default created := 0

default msg := "Image created outside of working hours"

created_str = input.evidence.predicate.buildDefinition.resolvedDependencies[i].annotations.created {
	some k
	input.evidence.predicate.buildDefinition.resolvedDependencies[i].name == input.evidence.subject[k].name
}

created = time.parse_rfc3339_ns(created_str)

allow {
	time.weekday(created) in input.config.args.workdays
	clock := time.clock(created)
	clock[0] >= input.config.args.start_hour
	clock[0] <= input.config.args.end_hour
}

msg = "Image created in working hours" {
	allow
}

verify = v {
	v := {
		"allow": allow,
		"summary": [{
			"allow": allow,
			"reason": msg,
			"details": sprintf("Image created on day %s, on hour %d", [time.weekday(created), time.clock(created)[0]]),
		}],
	}
}
