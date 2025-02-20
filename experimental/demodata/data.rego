package verify

import data.scribe as scribe

default allow := false
default violations := []
default asset := {}

asset = scribe.get_asset_data(input.evidence)

short_description = input.config.args.short_description
description = input.config.args.description
reason = input.config.args.reason
allow = input.config.args.allow
violations = input.config.args.violations

verify = v {
    v := {
        "allow": allow,
        "violation": {
            "type": "Invalid Report",
            "details": violations 
        },
        "short_description": short_description,
        "description": description,
		"asset": asset,
        "summary": [{
            "allow": allow,
            "reason": reason, 
            "violations": count(violations),
        }],
    }
}


