package verify

import future.keywords.in


default allow := false

default violations := []

default job_name := "semgrep-sast" # Configurable name for the secret detection job
job_name = input.config.args.job_name {
    input.config.args.job_name
}




# Define the expected YAML structure
default expected_yaml := {
    "job_name": "semgrep-sast",
    "scribe_type": "",
    "id": "",
    "query_id": "",
    "parent": "",
    "result_object": {
        "name": "",
        "id": "",
        "query_id": "",
        "ref": "",
        "status": "",
        "stage": "",
        "web_url": "",
        "created_at": "",
        "started_at": "",
        "finished_at": "",
        "user_id": "",
        "user_name": "",
        "username": ""
    },
    "project": {
        "ci_job_token_scope_enabled": ""
    },
    "artifacts": [
        {
            "file_type": "",
            "size": "",
            "filename": "",
            "file_format": ""
        }
    ],
    "runner": {
        "id": "",
        "description": "",
        "ip_address": "",
        "active": "",
        "paused": "",
        "is_shared": "",
        "runner_type": "",
        "name": "",
        "online": "",
        "status": ""
    },
    "tag_list": "",
    "commit_id": "",
    "commit_message": "",
    "commit_title": "",
    "commit_author_name": "",
    "commit_author_email": "",
    "commit_creation_date": "",
    "scribe_type": "",
    "parsed_logs": "",
    "reports": {
        "gl-sast-report.json": {
            "version": "",
            "vulnerabilities": "",
            "dependency_files": "",
            "scan": {
                "analyzer": {
                    "id": "",
                    "name": "",
                    "url": "",
                    "vendor": {
                        "name": ""
                    },
                    "version": ""
                },
                "scanner": {
                    "id": "",
                    "name": "",
                    "url": "",
                    "vendor": {
                        "name": ""
                    },
                    "version": ""
                },
                "type": "",
                "start_time": "",
                "end_time": "",
                "status": ""
            }
        }
    }
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






violations := { r |
    some pipeline in input.evidence.predicate.content[_].pipeline
    some job in pipeline.result_object.jobs
    job.name == expected_yaml.job_name
    r = {
        "non_matching_fields": non_matching_fields(input.job, expected_yaml)
    }
}

non_matching_fields(input, expected) = fields {
    fields := {field |
        field := input[field_name]
        field != expected[field_name]
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






