package policies.intoto_evidence

# import data
import future.keywords.in
import future.keywords.every

statement_type = "https://in-toto.io/Statement/v0.1"

checkIntoto(statement) {
    statement._type == statement_type
}



checkPredicate(statement, predicate) {
    statement.predicateType == predicate
}

checkInputExists(path, field) = v {
	path[field]
    v := path[field]
}

checkInputExistsDefault(path, field, defaultValue) = v {
	path[field]
    v := path[field]
}

checkInputExistsDefault(path, field, defaultValue) = v {
	not defined(path, field)
    v = defaultValue
}

checkInputExists(path, field) = v {
	not defined(path, field)
    v := ""
}

getEvContext(statement) = env {
    predicate := getPredicate(statement)
    env := predicate.environment
}

getPredicate(statement) = v {
    v := statement.predicate
}

getPredicateType(statement) = v {
    v := statement.predicateType
}

defined(path, field) {
    _ = path[field] 
}

checkConfig(inputField) = v {
    defined(inputField, "config")
    v := inputField.config
}

checkVerifier(inputField) = v {
    defined(inputField, "verifier")
    v := inputField.verifier
}

checkEvidence(inputField) = v {
    defined(inputField, "evidence")
    v := inputField.evidence
}

getEvidenceContextWithVerifier(match, verifierContext, defaultValues) = evidence {
    evidence =  getEvidenceContext(match,
        getEvidenceContext(defaultValues,
                {
                    "name":  checkInputExists(verifierContext, "name"),
                    "product_version":  checkInputExists(verifierContext, "product_version"),
                    "pipeline_name":  checkInputExists(verifierContext, "pipeline_name"),
                    "app_name":  checkInputExists(verifierContext, "app_name"),
                    "app_version":  checkInputExists(verifierContext, "app_version"),
                    "context_type":  checkInputExists(verifierContext, "context_type"),
                }
            )
        )
}

getEvidenceContext(match, defaultValues) = evidence {
    evidence := {
        "name": checkInputExistsDefault(match, "name", checkInputExists(defaultValues, "name")),  # Base Context
        "product_version": checkInputExistsDefault(match, "product_version", checkInputExists(defaultValues, "product_version")),
        "pipeline_name": checkInputExistsDefault(match, "pipeline_name", checkInputExists(defaultValues, "pipeline_name")),
        "app_name": checkInputExistsDefault(match, "app_name", checkInputExists(defaultValues, "app_name")),
        "app_version": checkInputExistsDefault(match, "app_version", checkInputExists(defaultValues, "app_version")),
        # "labels": checkInputExistsDefault(match, "labels", checkInputExists(defaultValues, "labels")),
        # "env":  checkInputExistsDefault(match, "env", checkInputExists(defaultValues, "env")),
        "timestamp": checkInputExistsDefault(match, "timestamp", checkInputExists(defaultValues, "timestamp")),
        "input_scheme": checkInputExistsDefault(match, "input_scheme", checkInputExists(defaultValues, "input_scheme")),
        "input_name": checkInputExistsDefault(match, "input_name", checkInputExists(defaultValues, "input_name")),
        "input_tag": checkInputExistsDefault(match, "input_tag", checkInputExists(defaultValues, "input_tag")),
        "content_type": checkInputExistsDefault(match, "content_type", checkInputExists(defaultValues, "content_type")),
        "context_type": checkInputExistsDefault(match, "context_type", checkInputExists(defaultValues, "context_type")),
        "predicate_type": checkInputExistsDefault(match, "predicate_type", checkInputExists(defaultValues, "predicate_type")),

        # Git Context
        "git_url": checkInputExistsDefault(match, "git_url", checkInputExists(defaultValues, "git_url")), 
        "git_branch": checkInputExistsDefault(match, "git_branch", checkInputExists(defaultValues, "git_branch")),
        "git_tag": checkInputExistsDefault(match, "git_tag", checkInputExists(defaultValues, "git_tag")),
        "git_commit": checkInputExistsDefault(match, "git_commit", checkInputExists(defaultValues, "git_commit")),
        "git_ref": checkInputExistsDefault(match, "git_ref", checkInputExists(defaultValues, "git_ref")),


        # Pipleline Context
        "workflow": checkInputExistsDefault(match, "workflow", checkInputExists(defaultValues, "workflow")),
        "job_name": checkInputExistsDefault(match, "job_name", checkInputExists(defaultValues, "job_name")),
        "run_id": checkInputExistsDefault(match, "run_id", checkInputExists(defaultValues, "run_id")),
        "build_num": checkInputExistsDefault(match, "build_num", checkInputExists(defaultValues, "build_num")),
        "actor": checkInputExistsDefault(match, "actor", checkInputExists(defaultValues, "actor")),

        # Git Target Context
        "target_git_url": checkInputExistsDefault(match, "target_git_url", checkInputExists(defaultValues, "target_git_url")), 
        "target_git_branch": checkInputExistsDefault(match, "target_git_branch", checkInputExists(defaultValues, "target_git_branch")),
        "target_git_tag": checkInputExistsDefault(match, "target_git_tag", checkInputExists(defaultValues, "target_git_tag")),
        "target_git_commit": checkInputExistsDefault(match, "target_git_commit", checkInputExists(defaultValues, "target_git_commit")),
        "target_git_ref": checkInputExistsDefault(match, "target_git_ref", checkInputExists(defaultValues, "target_git_ref")),

        # Image Target Context
        "imageID": checkInputExistsDefault(match, "imageID", checkInputExists(defaultValues, "imageID")), 
        # "repoDigest": checkInputExistsDefault(match, "repoDigest", checkInputExists(defaultValues, "repoDigest")), 
        # "imageTag": checkInputExistsDefault(match, "imageTag", checkInputExists(defaultValues, "imageTag")), 
        "image_name": checkInputExistsDefault(match, "image_name", checkInputExists(defaultValues, "image_name")), 

        # Dir Target Context
        "dir_id": checkInputExistsDefault(match, "dir_id", checkInputExists(defaultValues, "dir_id")), 
        "dir_path": checkInputExistsDefault(match, "dir_path", checkInputExists(defaultValues, "dir_path")), 

        # File Target Context
        "file_id": checkInputExistsDefault(match, "file_id", checkInputExists(defaultValues, "file_id")), 
        "file_path": checkInputExistsDefault(match, "file_path", checkInputExists(defaultValues, "file_path")), 

        "target_type": checkInputExistsDefault(match, "target_type", checkInputExists(defaultValues, "target_type")),
    }
}


