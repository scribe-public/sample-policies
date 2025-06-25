package verify

import future.keywords.in

default allow := false
default violations := []
default job_name := "semgrep-sast"


verify = v {

    v := {
        "allow" : allow,
        "violation" : {
            "type" : "semgrep-sast was not ran",
            "details" : violations,
        },
        "summary" : [{
            "allow" : allow,
            "reason" : reason,
            "violations" : count(violations),
        }],
    }
}

allow {
    count(violations) == 0
}

reason = v {
    allow
    v := "All semgrep-sast jobs have been ran in each pipeline"
}

reason = v {
    not allow
    v := "At least one semgrep-sast job has not been ran in each pipeline"
}


violations = j {
    j := {r |
        some pipeline in input.evidence.predicate.content[_].pipeline
        not has_matching_job_name(pipeline)
        r = {
            "scribe_type" : pipeline.scribe_type,
            "id": pipeline.id,
            "name": pipeline.name,
            "job_name": job_name
        }
    }
}

has_matching_job_name (pipeline) {
    some job in pipeline.result_object.jobs
    job.name == job_name
}
