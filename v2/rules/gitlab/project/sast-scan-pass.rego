package verify

import future.keywords.in
import data.scribe as scribe

default allow := false
default violations := []
default job_name := "semgrep-sast" 
default asset := {}

asset = scribe.get_asset_data(input.evidence)

verify = v {

    v := {
        "allow" : allow,
        "violation" : {
            "type" : "unsuccessful semgrep-sast scanning", 
            "details" : violations,
        },
		"asset": asset,
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
    v := "All semgrep-sast jobs have been ran and successful"
}

reason = v {
    not allow
    v := "At least one semgrep-sast job has been ran and not succesfully"
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
