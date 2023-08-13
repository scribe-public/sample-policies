package verify
import future.keywords.if

default allow := false
default created := 0
default created_str := "unknown"

verify = v {
    v := {
        "allow": allow,
        "errors": errors,
        "summary": [{
            "allow": allow,
            "reason": sprintf("Image is too old, created at: %d (earliest create date is %d)", [created, time.now_ns() - maximum_age])
        }]
    }
}

nanosecs_per_second = 1000 * 1000 * 1000
nanosecs_per_day = 24 * 60 * 60 * nanosecs_per_second
maximum_age = input.config.args.max_days * nanosecs_per_day

created_str = input.evidence.predicate.bom.metadata.component.properties[i]["value"] {
    input.evidence.predicate.bom.metadata.component.properties[i]["name"] == "created"
}
created = time.parse_rfc3339_ns(created_str)

allow {
    time.now_ns() < (created + maximum_age)
}

errors[msg] {
    created_str == "unknown"
    msg := "bom created not presented"
}