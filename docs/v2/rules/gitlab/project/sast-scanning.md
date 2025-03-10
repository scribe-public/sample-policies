# Run SAST Scanning in GitLab Project  
**Type:** Rule  
**ID:** `gitlab-project-sast-scanning`  
**Uses:** `gitlab/project/sast-scanning@v2/rules`  
**Source:** [v2/rules/gitlab/project/sast-scanning.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/sast-scanning.yaml)  
**Rego Source:** [sast-scanning.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/sast-scanning.rego)  
**Labels:** Gitlab, Project  

Verify SAST scanning is performed for the GitLab project.

> Rule Result will be set as 'open' if evidence is missing.  
> Signed Evidence for this rule **IS NOT** required by default but is recommended.  

## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | - platform=gitlab<br>- asset_type=project |

