# Verify Exposed Credentials  
**Type:** Rule  
**ID:** `jenkins-exposed-credentials`  
**Uses:** `jenkins/folder/exposed-credentials@v2/rules`  
**Source:** [v2/rules/jenkins/folder/exposed-credentials.yaml](https://github.com/scribe-public/sample-policies/v2/rules/jenkins/folder/exposed-credentials.yaml)  
**Rego Source:** [exposed-credentials.rego](https://github.com/scribe-public/sample-policies/v2/rules/jenkins/folder/exposed-credentials.rego)  
**Labels:** Jenkins, Folder  

Verify there are no exposed credentials.

> Evidence for this rule **IS NOT** required by default but is recommended.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | - asset_type=folder |

