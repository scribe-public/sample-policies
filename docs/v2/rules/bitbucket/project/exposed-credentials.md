# Prevent Credential Exposure  
**Type:** Rule  
**ID:** `bb-project-exposed-credentials`  
**Uses:** `bitbucket/project/exposed-credentials@v2/rules`  
**Source:** [v2/rules/bitbucket/project/exposed-credentials.yaml](https://github.com/scribe-public/sample-policies/v2/rules/bitbucket/project/exposed-credentials.yaml)  
**Rego Source:** [exposed-credentials.rego](https://github.com/scribe-public/sample-policies/v2/rules/bitbucket/project/exposed-credentials.rego)  
**Labels:** Bitbucket, Project  

Verify access to the Bitbucket project is blocked if exposed credentials are detected.

> Rule Result will be set as 'open' if evidence is missing.  
> Signed Evidence for this rule **IS NOT** required by default but is recommended.  

## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | - platform=bitbucket<br>- asset_type=project |

