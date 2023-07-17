package verify

config := {
"cve_count_bar": 0,
"cve_error_level":"error"
}

verify = v {
    v := {
        "allow": allow,
        "reason": "Errors are BIG No-No",
        "details": json.marshal(violations),
        "violations": count(violations)
    }
}

default allow := false

allow {
    count(violations) <= config.cve_count_bar
}

violations = j {
    d := base64.decode(input.evidence.predicate.content)
    djson := json.unmarshal(d)                    
    j := { r | 
            some v
            v = djson.runs[0].results[_]
            v.level == config.cve_error_level
            r = v.ruleId
        }
}
