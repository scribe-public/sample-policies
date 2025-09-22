package verify

import data.scribe as scribe
import future.keywords.in

default within := false
default allow = false
default violations = []
default asset := {}

asset := scribe.get_asset_data(input.evidence)

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "Blocklisted Packages",
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
	count(violations) <= input.config.args.blocklisted_limit
}

reason = v {
	allow
	v := "All packages in the SBOM are *not* on the blocklist"
}

reason = v {
	not allow
	v := "Several packages in the SBOM are on the blocklist"
}

violations = j {
	j := {r |
		components := input.evidence.predicate.bom.components
		some i
		p := components[i].purl
		some k
		b := input.config.args.blocklist[k]
		blocked_pkg(p, b)
		r = {"package": p}
	}
}

parse_version(pkg) = [maj, min, patch] {
	# Trim package name, if any
    split_pkg := split(pkg, "@")
    v := split_pkg[count(split_pkg) - 1]
    # Drop leading "v"
    no_v := trim_prefix(v, "v")

    # Drop suffix after dash (pre-release, build metadata)
    base := split(no_v, "-")[0]

    parts := split(base, ".")
    count(parts) >= 1
    maj := to_number(parts[0])

    count(parts) > 1
    min := to_number(parts[1])

    count(parts) > 2
    patch := to_number(parts[2])
}

semver_within(pkg, block_pkg) {
	block_pkg.min
    block_pkg.max
	parsed_min := parse_version(block_pkg.min)
	parsed_max := parse_version(block_pkg.max)
	parsed_semver = parse_version(pkg)
    parsed_semver >= parsed_min
    parsed_semver <= parsed_max
}

semver_within(pkg, block_pkg) {
	block_pkg.min
    not block_pkg.max
	parsed_min := parse_version(block_pkg.min)
	parsed_semver = parse_version(pkg)
    parsed_semver >= parsed_min
}

semver_within(pkg, block_pkg) {
	not block_pkg.min
    block_pkg.max
	parsed_max := parse_version(block_pkg.max)
	parsed_semver = parse_version(pkg)
    parsed_semver <= parsed_max
}

semver_within(pkg, block_pkg) {
	not block_pkg.min
    not block_pkg.max
}

blocked_pkg(pkg, block_pkg) {
	is_object(block_pkg)
	contains(pkg, block_pkg.name)
	semver_within(pkg, block_pkg)
}

blocked_pkg(pkg, block_pkg) {
	is_string(block_pkg)
	contains(pkg, block_pkg)
}