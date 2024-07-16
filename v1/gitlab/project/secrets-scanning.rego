package verify

import future.keywords.in


default allow := false

default violations := []

default job_name := "secret_detection" # Configurable name for the secret detection job

verify = v {

    v := {
        "allow" : allow,
        "violation" : {
            "type" : "Secret scanning was not ran",
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
    v := "All secrets scanning jobs have been ran"
}

reason = v {
    not allow
    v := "At least one secret scanning job has not been ran"
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





