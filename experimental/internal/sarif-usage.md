
# SARIF Policies

## Concept
A Sarif policy is implemented by filtering the sarif rule results by some criteria, and (optionally) setting a bar on the number of allowed violations.

## Usage
For each policy, create a config with the appropriate rego, in the following structure:

```rego
package verify
import data.sarif

default allow := false
default violations := []

config := {
   "ruleLevel": ["note"],
   "precision": [],
   "ruleIDs": [],
   "ignore": [],
   "maxAllowed": 3
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

```

The policies will differ by the values of the config fields.
