package verify
import data.sarif

default allow := false
default violations := []

config := {
   "ruleLevel": ["note"],
   "precision": [],
   "ruleIDs": ["CVE-2022-0563"],
   "ignore": [],
   "maxAllowed": 1
}

verify = v {
        v := {
        "allow": allow,
        "violations": violations,
            "summary": [{
            "allow": allow,
            "reason":  sprintf("# of violations: %d (max allowed: %d)", [count(violations), config.maxAllowed]),
            "violations": count(violations),
        }]
    }
}

allow {
    sarif.allow(config) == {true}
}

violations = v {
    v := sarif.violations(config)
}
