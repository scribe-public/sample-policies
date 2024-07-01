package verify

import future.keywords.in


default allow := false

default violations := []

default job_name := "semgrep-sast" # Configurable name for the secret detection job

default condition_to_test := ""
default condition_to_pass := ""

job_name = input.config.args.job_name {
    input.config.args.job_name
}

condition_to_test = input.config.args.condition_to_test {
    input.config.args.condition_to_test
}

condition_to_pass = input.config.args.condition_to_pass {
    input.config.args.condition_to_pass 
}


verify = v {

    v := {
        "allow" : allow,
        "violation" : {
            "type" : "semgrep-sast scanning was ran but not succesful",
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
    v := "All semgrep-sast jobs have successfully passed the condition"
}

reason = v {
    not allow
    v := "At least one semgrep-sast job has been not successfully passed the condition"
}


violations = j {
    j := {r |
        some pipeline in input.evidence.predicate.content[_].pipeline
        some job in pipeline.result_object.jobs
        job.name == job_name


        r = {
            "scribe_type" : pipeline.scribe_type,
            "pipeline_id": pipeline.id,
            "pipeline_name": pipeline.name,
            "job_name": job_name,
            "job_status": job.result_object.status
        }
    }
}

# Conditions: (Read as Condition is...)

# Useless as this will on run if the name of the job is semgro-sast
# is_name(condition_to_test, condition_to_pass, job) {
#     condition_to_test == "name"
#     job.name == condition_to_pass
# }

is_id {
    condition_to_test == "id"
}

is_query_id {
    condition_to_test == "query_id"
}

is_ref {
    condition_to_test == "ref"
}

is_status() {
    condition_to_test == "status"
}

is_stage() {
    condition_to_test == "stage"
}

is_web_url() {
    condition_to_test == "web_url"
}

is_user_id() {
    condition_to_test == "user_id"
}

is_username() {
    condition_to_test == "username"
}

is_project() {
    condition_to_test == "project"
}

is_artifacts() {
    condition_to_test == "artifacts"
}

is_runner() {
    condition_to_test == "runner"
}

is_tag_list() {
    condition_to_test == "tag_list"
}

is_reports() {
    condition_to_test == "reports"
}






