package verify

default allow = false

default exceeding = 0

default msg := "SBOM is too old"

import future.keywords.if

verify = v if {
	v := {
		"allow": allow,
		"summary": [{
			"allow": allow,
			"reason": msg,
            "details": sprintf("SBOM created at: %d (earliest create date is %d)", [timestamp, time.now_ns() - maximum_age]),
			"exceeding": exceeding,
		}],
	}
}

nanosecs_per_second = (1000 * 1000) * 1000

nanosecs_per_day = ((24 * 60) * 60) * nanosecs_per_second

maximum_age = input.config.args.max_days * nanosecs_per_day

timestamp = time.parse_rfc3339_ns(input.evidence.predicate.bom.metadata.timestamp)

exceeding = time.now_ns() - (timestamp + maximum_age)

allow if {
	exceeding <= 0
}

msg = "SBOM is fresh enough" if allow

errors[msg] {
	not input.evidence.predicate.bom.metadata.timestamp
	msg := "bom timestamp not presented"
}
