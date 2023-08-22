package verify
import future.keywords.in

default allow := false
default violations := []
default dependency := {"uri":"", "name":"", "annotations":{"version":""}}
default msg := "The builder has some blacklisted dependencies"

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

msg = "No blacklisted dependencies found" { allow }

violations = j {
j := { r |
    some blacklisted in input.config.args.blacklist
    some dependency in input.evidence.predicate.runDetails.builder.builderDependencies
    name_match(dependency, blacklisted.name)
    dependency.annotations.version == blacklisted.version
    r = {
            "type": "dependency",
            "details": {
                "name": blacklisted.name,
                "version": blacklisted.version,
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