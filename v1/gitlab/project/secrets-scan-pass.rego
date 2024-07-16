package verify

import future.keywords.in


default allow := false

default violations := []

default job_name := "secret_detection" # Configurable name for the secret detection job

job_name = input.config.args.job_name {
    input.config.args.job_name
}


verify = v {

    v := {
        "allow" : allow,
        "violation" : {
            "type" : "Secret scanning was ran but not succesful",
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
    v := "All secrets scanning jobs have been ran and successful"
}

reason = v {
    not allow
    v := "At least one secret scanning job has been ran and not succesfully"
}


violations = j {
    j := {r |
        some pipeline in input.evidence.predicate.content[_].pipeline
        some job in pipeline.result_object.jobs
        job.name == job_name
        job.result_object.status != "success"
        r = {
            "scribe_type" : pipeline.scribe_type,
            "pipeline_id": pipeline.id,
            "pipeline_name": pipeline.name,
            "job_name": job_name,
            "job_status": job.result_object.status
        }
    }
}


