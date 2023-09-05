package verify
import future.keywords.in

default allow := false
default violations := []
default dependency := {"uri":"", "name":"", "annotations":{"version":""}}
default msg := "The builder has some blocklisted dependencies"

verify = v {
        v := {
        "allow": allow,
        "violations": violations,
            "summary": [{
            "allow": allow,
            "reason":  msg,
            "violations": count(violations),
        }]
    }
}

allow {
    count(violations) == 0
}

msg = "No blocklisted dependencies found" { allow }

violations = j {
j := { r |
    some blocklisted in input.config.args.blocklist
    some dependency in input.evidence.predicate.runDetails.builder.builderDependencies
    name_match(dependency, blocklisted.name)
    dependency.annotations.version == blocklisted.version
    r = {
            "type": "dependency",
            "details": {
                "name": blocklisted.name,
                "version": blocklisted.version,
            }
        }
    }
}

name_match(dependency, name) {
    dependency.name == name
}

name_match(dependency, name) {
    contains(dependency.uri, name)
}