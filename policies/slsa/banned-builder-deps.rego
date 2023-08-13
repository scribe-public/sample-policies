package verify
import future.keywords.in

default allow := false
default violations := []
default dependency := {"uri":"", "name":"", "annotations":{"version":""}}

verify = v {
        v := {
        "allow": allow,
        "violations": violations,
            "summary": [{
            "allow": allow,
            "reason":  "The builder has some blacklisted dependencies",
            "violations": count(violations),
        }]
    }
}

allow {
    count(violations) == 0
}

violations = j {
j := { r |
    some blacklisted in input.config.args.blacklist
    some dependency in input.evidence.predicate.buildDefinition.resolvedDependencies
    contains(dependency.uri, blacklisted.uri)
    tags_match(dependency.annotations, blacklisted.tag)
    r = {
            "type": "dependency",
            "details": {
                "uri": blacklisted.uri,
                "tag": blacklisted.tag,
            }
        }
    }
}

tags_match(annotations, t2) {
    annotations.tag == t2
}

tags_match(annotations, t2) {
    annotations.git_tag == t2
}