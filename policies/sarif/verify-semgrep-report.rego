package verify
import future.keywords.in

default allow := false
default violations := []

verify = v {
        v := {
        "allow": allow,
        "violations": violations,
            "summary": [{
            "allow": allow,
            "reason":  sprintf("# of violations: %d (max allowed: %d)", [count(violations), input.config.args.violations_threshold]),
            "violations": count(violations),
        }]
    }
}



allow {
    count(violations) <= input.config.args.violations_threshold
}

violations = j {
    j := { r |
        d := base64.decode(input.evidence.predicate.content)
        provenance := json.unmarshal(d)
        some rule_id in input.config.args.rule_ids
        run = provenance.runs[_].results[_]
        contains(run.ruleId, rule_id)
        r := {
            "rule": run.ruleId,
            "location": run.locations[0].physicalLocation.artifactLocation.uri
        }
    }
}
