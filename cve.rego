package verify
default allow = false
default violations = []

config := {
    "cve_count_bar": 2,
    "cve_error_level":"warning"
}

verify = v {
        v := {
        "allow": allow,
        "violations": violations,
            "summary": [{
            "allow": allow,
            "reason":  "Errors are BIG No-No",
            "violations": count(violations),
        }]
    }
}

allow {
    count(violations) <= config.cve_count_bar
}

violations = j {
    d := base64.decode(input.evidence.predicate.content)
    djson := json.unmarshal(d)                    
    j := { r | 
        v = djson.runs[_].results[_]
        v.level == config.cve_error_level
        r = {
            "type": "cve",
            "details": v.ruleId,
        }
    }
}

errors[msg] {
    not input.evidence.predicate.content
    msg := "generic evidence error"
}