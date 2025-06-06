package verify

import future.keywords.in
import data.scribe as scribe

default allow := false
default violations := []
default asset := {}

asset = scribe.get_asset_data(input.evidence)

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "admins",
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

allow {
	count(violations) == 0
}

reason = v {
	allow
	v := "all commits are authored by allowed authors"
}

reason = v {
	not allow
	v := "some commits are not authored by allowed authors"
}

violations = j {
	j := {r |
        some commit in input.evidence.predicate.content[_].commit
		not match_any_name(commit)
        r = {
			"commit": commit.id,
			"author": commit.result_object.author_name,
        }
	}
}

match_any_name(commit) {
    some author in input.config.args.allowed_authors
	commit.result_object.author_name == author
}
