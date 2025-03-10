# Rule: Prevent Credential Exposure  
**ID:** `bb-project-exposed-credentials`  
**Uses:** `bitbucket/project/exposed-credentials@v2/rules`  
**Source:** [v2/rules/bitbucket/project/exposed-credentials.yaml](https://github.com/scribe-public/sample-policies/v2/rules/bitbucket/project/exposed-credentials.yaml)  
**Rego Source:** [exposed-credentials.rego](https://github.com/scribe-public/sample-policies/v2/rules/bitbucket/project/exposed-credentials.rego)  
**Short Description:** Verify access to the Bitbucket project is blocked if exposed credentials are detected.  
**Labels:** Bitbucket, Project  
> Evidence for this rule **IS NOT** required by default but is recommended.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | ['platform=bitbucket', 'asset_type=project'] |

