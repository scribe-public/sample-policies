package verify

import future.keywords.in


default allow := false

default violations := []

default secret_detection_job_name := "secret_detection" # Configurable name for the secret detection job

secret_detection_identifier = input.config.args.secret_detection_job_name {
    input.config.args.secret_detection_job_name
}

verify = v {

    v := {
        "allow" : allow,
        "violation" : {
            "type" : "Not allowed to share secrets",
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
        pipelines_without_secret_detection := {val|
            some pipeline in content.pipeline.content[_].pipeline
            not has_at_least_one_secret_detection(pipeline)    
            val := pipeline
        }
        some pipeline in pipelines_without_secret_detection
        r = {
            "scribe_type" : pipeline.scribe_type,
            "id": pipeline.id,
            "name": pipeline.name
        }
    }
}

has_at_least_one_secret_detection (pipeline) {
    some job in pipeline.result_object.jobs
    job.name == secret_detection_job_name
}       





