package internal.git_owner

import data
import future.keywords.in
import future.keywords.every
import data.internal.sbom_parser as parser
import data.internal.intoto_evidence as evidence

default allow = false
default allow_signed_commits = false
default allow_code_owners = false
default evidenceMap = {}
default verifier = {}

list = l {
    verifierContext := evidence.checkVerifier(input)
    config := evidence.checkConfig(input)
    targetContext =  evidence.getEvidenceContextWithVerifier(config, verifierContext,
        {
            "input_scheme": "git",
            "predicate_type": "https://cyclonedx.org/bom/v1.5",
        }
    )

    l := {
        "target": {
            targetContext
        }
    }
}

verify = v {
    v := {
        "allow": allow,
        "errors": errors,
        "summary": summary,
        "violation": violation,
        "input": input.config,
        "evidence":  evidenceMap,
        "verifier": verifier
    }
}

######################################
# allow
######################################

allow {  
    allow_signed_commits
    allow_code_owners
}

allow_signed_commits { 
    validInput
    bom := checkTargetBom(input)
    parser.validateBom(bom) 
    parser.checkGitScheme(bom)

    # verify git signatures
    config := evidence.checkConfig(input)
    # config.signed_commits
    notSigned := checkSigned(config, bom)
    count(notSigned) == 0
}

allow_code_owners {  
    validInput
    not message_skip_git_owner
    bom := checkTargetBom(input)

    parser.validateBom(bom) 
    parser.checkGitScheme(bom)

    # verify git owners
    config := evidence.checkConfig(input)
    unallowedOwners := checkOwners(config, bom)  
    count(unallowedOwners) == 0    
}

allow_code_owners {  
    message_skip_git_owner_allow
}

######################################
# evidence
######################################


evidenceMap = v {
    context := checkTargetContext(input)

    v := {
        "target": {
            context
        }
    }    
}


verifier = v {
    v := evidence.checkVerifier(input)
}

######################################
# errors
######################################

errors[msg] {
    message_scheme_error
    msg := message_scheme_error
}

errors[msg] {
    message_sbom_error
    msg := message_sbom_error
}

errors[msg] {
    message_evidence_error
    msg := message_evidence_error
}

errors[msg] {
    message_target_evidence_error
    msg := message_target_evidence_error
}

errors[msg] {
    message_input_verifier_error
    msg := message_input_verifier_error
}

errors[msg] {
    message_input_config_error
    msg := message_input_config_error
}

errors[msg] {
    message_input_evidence_error
    msg := message_input_evidence_error
}

errors[msg] {
    message_input_error
    msg := message_input_error
}

errors[msg] {
    message_skip_git_owner
    msg := message_skip_git_owner
}

errors[msg] {
    message_skip_git_owner_allow
    msg := message_skip_git_owner_allow
}


######################################
# details
######################################

details_signed_commits = d {
    config := evidence.checkConfig(input)
    bom := checkTargetBom(input)
    notSigned := checkSigned(config, bom)
    # count(notSigned) > 0
    d := notSigned
}


details_code_owners = d {
    validInput
    bom := checkTargetBom(input)
    files := parser.getFilesLastCommit(bom)
    count(files) > 0
    config := evidence.checkConfig(input)
    count(userFields) > 0
    unallowedOwners := checkOwners(config, bom)  
    d := unallowedOwners
}

######################################
# message
######################################

message_skip_git_owner = v {  
    validInput
    bom := checkTargetBom(input)
    files := parser.getComponentsByTypeAndGroup(bom, parser.typeFile, parser.typeFile)
    count(files) == 0
    v :=  "skipping git owner check - no files in sbom"
}

message_skip_git_owner = v {  
    validInput
    bom := checkTargetBom(input)
    not parser.getComponentsByTypeAndGroup(bom, parser.typeFile, parser.typeFile)
    v :=  "skipping git owner check - no files in sbom"
}

message_skip_git_owner_allow = v {  
    config := evidence.checkConfig(input)
    count(userFields) == 0
    v :=  "skipping git owner check - no users defined in config"
}

message_summary_signed_commits = v {
    validInput
    bom := checkTargetBom(input)

    config := evidence.checkConfig(input)
    notSigned := checkSigned(config, bom)
    # count(notSigned) > 0

    files := parser.getFiles(bom)    
    v :=  {
        "type": "signed-commit",
        "allow": allow_signed_commits,
        "details": sprintf("%v/%v files failed commit signature rule",[count(notSigned), count(files)]),
        "violations": count(notSigned),
    }
}

message_summary_code_owners = v {
    validInput
    not message_skip_git_owner_allow
    bom := checkTargetBom(input)
    files := parser.getFilesLastCommit(bom)
    config := evidence.checkConfig(input)

    unallowedOwners := checkOwners(config, bom)  
    v := {
        "type": "codeowner",
        "allow": allow_code_owners,
        "details": sprintf("%v/%v files failed code owner rule",[count(unallowedOwners), count(files)]),
        "violations": count(unallowedOwners),
    }
}

message_summary_code_owners = v {
    validInput
    message_skip_git_owner_allow  
    bom := checkTargetBom(input)
    files := parser.getFilesLastCommit(bom)
    v := {
        "type": "codeowner",
        "allow": allow_code_owners,
        "details": sprintf("%v/%v files failed code owner rule",[0, count(files)]),
        "violations": 0,
        "reason": message_skip_git_owner_allow,
    }
}

message_input_error = v {
    not validInput
    v := {
        "input":  "input is invalid"
    }
}

message_input_verifier_error = v {
    not evidence.checkVerifier(input)
    v := {
        "input":  "input missing verifier field"
    }
}

message_input_config_error = v {
    not evidence.checkConfig(input)
    v :=  {
        "input":  "input missing config field"
    }
}

message_input_evidence_error = v {
    not evidence.checkEvidence(input)
    v :=  {
        "input":  "input missing evidence field"
    }
}

message_scheme_error = v {
    bom := checkTargetBom(input)
    not parser.checkGitScheme(bom)  
    scheme := parser.getScheme(bom)
    v := {
        "scheme":  sprintf("scheme is %v instead of %v",[scheme, parser.gitScheme])
    }
}

message_statement_error = v {
    statement := checkTargetEvidence(input)
    not parser.checkBomStatement(statement)
    v := {
        "evidence":  sprintf("evidence type is %v instead of %v",[statement.PredicateType, parser.bomPredicate])
    }
}

message_sbom_error = v {
    bom := checkTargetBom(input)
    not parser.validateBom(bom)
    v := {
        "SBOM": "input is not a SBOM"
    }
}

message_evidence_error = v { 
    not evidence.checkEvidence(input)
    v := {
        "evidence": "no evidence found"
    }
}

message_target_evidence_error = v { 
    not checkTargetEvidence(input)
    v := {
        "evidence": "no target evidence found"
    }
}

message_target_evidence_error = v { 
    not checkTargetEvidence(input)
    evidenceField := evidence.checkEvidence(input)
    count(evidenceField) == 0
    v := {
        "evidence": "no target evidence found"
    }
}

message_evidence_error = v { 
    evidenceField := evidence.checkEvidence(input)
    count(evidenceField) == 0
    v := {
        "evidence": "no evidence found"
    }
}



######################################
# violation
######################################

violation[msg] {
    count(details_signed_commits) > 0
    msg := {
        "type": "signed-commits",
        "details": details_signed_commits,
    }
}

violation[msg] {
    count(details_code_owners) > 0
    msg := {
        "type": "codeowner",
        "details": details_code_owners,
    }
}

violation[msg] {
    not details_signed_commits
    msg := {
        "type": "signed-commits",
        "details": "not available"
    }
}

violation[msg] {
    not details_code_owners
    not message_skip_git_owner_allow
    msg := {
        "type": "codeowner",
        "details": "not available"
    }
}

# violation[msg] {
#     message_skip_signed_commits
#     msg :=  {
#         "type": "signed-commits",
#         "details": message_skip_signed_commits
#     }
# }


######################################
# summary
######################################

summary[msg] {
    not message_summary_code_owners
    msg := {
        "type": "codeowner",
        "details": "not available"
    }
}

summary[msg] {
    not message_summary_signed_commits
    # not message_skip_signed_commits
    msg := {
        "type": "signed-commits",
        "details": "not available"
    }
}

# summary[msg] {
#     message_skip_signed_commits
#     msg :=  {
#         "type": "signed-commits",
#         "details": message_skip_signed_commits
#     }
# }

summary[msg] {
    msg := message_summary_signed_commits
}

summary[msg] {
    msg := message_summary_code_owners
}

validInput {
    not message_scheme_error
    not message_sbom_error
    not message_evidence_error
    not message_target_evidence_error
    not message_input_verifier_error
    not message_input_config_error
    not message_input_evidence_error
}


######################################
# checks
######################################

checkSigned(config, bom) = c {
    files := parser.getFilesLastCommit(bom)
    #check specific or default owners against the files
    unsigned_files := { x[_] |
        some i
        fileEntry := files[i]
        x := checkSpecificOrDefaultSigned(config, fileEntry, bom)
    }
    c := unsigned_files
}


checkOwners(config, bom) = c {
    files := parser.getFilesLastCommit(bom)
    verified_files := { x[_] |
        some i
        fileEntry := files[i]
        x := checkSpecificOrDefaultUsers(config, fileEntry)
    }
    c := files - verified_files
}


######################################
# functions
######################################

# If match on specific rule path
# checkSpecificOrDefaultUsers(config, fileEntry) = o {
#     o := fileEntry
# }
 
# Specific match
checkSpecificOrDefaultUsers(config, fileEntry) = o {
    o := checkSpecificUsersAllow(config, fileEntry)
    count(o) > 0
}

# Default match, No specific rule path match passed 
checkSpecificOrDefaultUsers(config, fileEntry) = o {
    # checkUserDefaultFields(config)
    specificFieldMatchsAllowed := checkSpecificUsersAllow(config, fileEntry)
    count(specificFieldMatchsAllowed) == 0
    o := checkDefaultUsers(config, fileEntry)
}

# Default match, No specific rule path match
checkSpecificOrDefaultUsers(config, fileEntry) = o {
    checkUserDefaultFields(config)
    not checkSpecificUsersMatch(config,fileEntry)
    o := checkDefaultUsers(config, fileEntry)
}

# ACCEPT, No default rule provided, No specific rule path match
checkDefaultUsers(config, fileEntry) = o {
    not checkUserDefaultFields(config)
    specificFieldMatchs := checkSpecificUsersMatch(config,fileEntry)
    count(specificFieldMatchs) == 0
    o := { fileEntry }
}


# If match on specific rule path
checkSpecificOrDefaultSigned(config, fileEntry, bom) = o {
    o := checkSpecificSigned(config, fileEntry, bom)
    count(o) > 0
}

# If no match on specific rule path, match on default field
checkSpecificOrDefaultSigned(config, fileEntry, bom) = o {
    specificSignedMatchs := checkSpecificSigned(config, fileEntry, bom)
    specificUnsignedMatchs := checkSpecificUnsigned(config, fileEntry, bom)
    count(specificSignedMatchs) == 0
    count(specificUnsignedMatchs) == 0
    o := checkDefaultSigned(config, fileEntry, bom)
}

checkSpecificOrDefaultSigned(config, fileEntry, bom) = o {
    not checkSpecificSigned(config, fileEntry, bom)
    o := checkDefaultSigned(config, fileEntry, bom)
}

# If no configured specific rule path, match on default field
# checkSpecificOrDefaultSigned(config, fileEntry) = o {
#     not checkSpecificSigned(config)
#     o := checkDefaultUsers(config, fileEntry)
# }


getDefaultField(config) = def {
    def := evidence.checkInputExists(config, "default")     
}

getSpecificField(config) = specific {
    specific := evidence.checkInputExists(config, "specific")     
}

collectInfoForCommits(statement, commits) = info {
    bom := parser.getBom(statement)
    info := { x |
        some i
        commitHash := commits[i]
        files := parser.getFilesForGitCommit(bom, commitHash)
        author := parser.getCommitAuthor(bom, commitHash) 
        x := {            
            "commit": commitHash,
            "author": author,
            "files": files,
        }
    }
}


checkSignedCommits(bom) {
    notSigned := parser.getNotSigneddFiles(bom)
    count(notSigned) == 0
}

defined(path, field) {
    _ = path[field] 
}


checkTargetEvidence(inputParam) = v {
	evidenceField := evidence.checkEvidence(inputParam)
    count(evidenceField) > 0
    v := evidenceField[0]
}

checkTargetBom(inputParam) = v {
	statement := checkTargetEvidence(inputParam)
    v := parser.getBom(statement)
}

checkTargetContext(inputParam) = v {
	statement := checkTargetEvidence(inputParam)
    v := evidence.getEvContext(statement)
}

checkSpecificUsersAllow(config, fileEntry) = o {
    specificField := getSpecificField(config)
    count(specificField) > 0 # ignore default owners
    o := { x |
        some i,j
        userEntry := specificField[i]
        # startswith(fileEntry.file, userEntry["path"])
        regex.match(userEntry["path"], fileEntry.file)
        usersList := userEntry["users"]
        usersList[j] == fileEntry["email"]
        x := fileEntry
    }
}

checkSpecificUsersMatch(config, fileEntry) = o {
    specificField := getSpecificField(config)
    count(specificField) > 0 # ignore default owners
    o := { x |
        some i
        userEntry := specificField[i]
        # startswith(fileEntry.file, userEntry["path"])
        regex.match(userEntry["path"], fileEntry.file)
        usersList := userEntry["users"]
        x := fileEntry
    }
}

checkSpecificSigned(config, fileEntry, bom) = o {
    unsignedFiles := parser.getNotSigneddFiles(bom)
    specificField := getSpecificField(config)

    count(unsignedFiles) > 0 # ignore default owners
    o := { x |
        some i,j
        userEntry := specificField[i]
        # startswith(fileEntry.file, userEntry["path"])
regex.match(userEntry["path"], fileEntry.file)
        unsignedFiles[j] == fileEntry.file
        userEntry["signed-commit"]
        x := fileEntry
    }
}

checkSpecificUnsigned(config, fileEntry, bom) = o {
    unsignedFiles := parser.getNotSigneddFiles(bom)
    specificField := getSpecificField(config)

    count(unsignedFiles) > 0 # ignore default owners
    o := { x |
        some i,j
        userEntry := specificField[i]
        # startswith(fileEntry.file, userEntry["path"])
regex.match(userEntry["path"], fileEntry.file)
        unsignedFiles[j] == fileEntry.file
        userEntry["signed-commit"] == false
        x := fileEntry
    }
}

checkDefaultUsers(config, fileEntry) = o {
    defualtField := getDefaultField(config)
    checkUserDefaultFields(config)
    o := { x |
        some i
        user := defualtField["users"][i]     
        user == fileEntry["email"]
        x := fileEntry
    }
}

checkDefaultSigned(config, fileEntry, bom) = o {
    unsignedFiles := parser.getNotSigneddFiles(bom)
    defualtField := getDefaultField(config)
    defualtField["signed-commit"]

    o := { x |
        some i
        file := unsignedFiles[i]
        fileEntry.file == file
        x := fileEntry
    }
}

checkUserDefaultFields(config) = v {
    defaultField = getDefaultField(config)
    defined(defaultField, "users")
    v := defaultField["users"]
    count(v) > 0
}

checkUserSpecificFields(config) = v {
    specificField = getSpecificField(config)
    v := { x[_] |
            some i
            userEntry := specificField[i]
            defined(userEntry, "users")
            x := userEntry
    }

    count(v) > 0
}


userFields[msg] {
    config := evidence.checkConfig(input)
    msg := checkUserDefaultFields(config)
}

userFields[msg] {
    config := evidence.checkConfig(input)
    msg := checkUserSpecificFields(config)
}




######################################
# debug
######################################

# debug = d {
#     statement := checkTargetEvidence(input)    
#     bom := parser.getBom(statement)
#     config := input.config
#     adminOwners := getAdmins(config)
#     defualtOwners := getDefaultOwners(config)
#     specificOwners := getSpecificOwners(config)
#     files := parser.getFilesLastCommit(bom)
#     checkedOwners := checkOwners(config, bom)    

#     d := {
#         "admins": adminOwners,
#         "default": defualtOwners,
#         "countCheckedOwners": count(checkedOwners),
#         "countDefault": count(defualtOwners),
#         "countSpec": count(specificOwners),
        
#         "checkedOwners": checkedOwners,
#     }
# }