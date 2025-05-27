package verify

import future.keywords.in
import data.scribe as scribe

default allow := false
default created_str := "unknown"
default created := 0
default violations := []
default asset := {}

asset = scribe.get_asset_data(input.evidence)

short_description = "Verify that an image was created during working hours"

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "Image Creation Time",
			"details": violations,
		},
		"asset": asset,
		"short_description": short_description,
		"summary": [{
			"allow": allow,
			"reason": reason,
		}],
	}
}

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

reason = v {
	allow
	v := "Image was created within the allowed time interval"
}

reason = v {
	not allow
	v := "Image was *not* created within the allowed time interval"
}

violations = v {
	not allow
	v := [{"msg": sprintf("Image created on day %s, on hour %d", [time.weekday(created), time.clock(created)[0]])}]
}
