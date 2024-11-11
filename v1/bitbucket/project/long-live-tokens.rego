package verify

import future.keywords.in

default allow := false

default violations := []

default max_days := 30

verify = v {
    v := {
        "allow": allow,
        "violation": {
            "type": "long live tokens",
            "details": violations,
        },
        "summary": [{
            "allow": allow,
            "reason": reason,
            "violations": count(violations),
        }],
    }
}

allow {
    count(violations) == 0
}

max_days := input.config.args.max_days {
    input.config.args.max_days
}

nanosecs_per_second := (1000 * 1000) * 1000
nanosecs_per_day := ((24 * 60) * 60) * nanosecs_per_second
max_lifetime := max_days * nanosecs_per_day

adjust_timezone(ts) := adj_ts {
    ts_with_t := replace(ts, " ", "T")
    adj_ts := ts_with_t
    contains(ts, "+")
}

adjust_timezone(ts) := adj_ts {
    ts_with_t := replace(ts, " ", "T")
    not contains(ts, "+")
    adj_ts := concat("", [ts_with_t, "Z"])
}

reason = v {
    v := sprintf("%d violations | 0 max allowed", [count(violations)])
}

violations = {r |
    some token in input.evidence.predicate.content[_].token
    long_live_token(token)
    r := {
        "token": token.name,
        "message": "created more than max_allowed days ago",
    }
}

long_live_token(token) {
    created_at := adjust_timezone(token.result_object.created_at)
    created := time.parse_rfc3339_ns(created_at)
    created < time.now_ns() - max_lifetime
}
