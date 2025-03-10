# GitLab pipeline verify labels exist  
**Type:** Rule  
**ID:** `gitlab-pipeline-verify-labels-exist`  
**Uses:** `gitlab/pipeline/verify-labels-exist@v2/rules`  
**Source:** [v2/rules/gitlab/pipeline/verify-labels-exist.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/pipeline/verify-labels-exist.yaml)  
**Rego Source:** [verify-labels-exist.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/pipeline/verify-labels-exist.rego)  
**Labels:** Gitlab, Pipeline  

Verify the pipeline has all required label keys and values.

> Evidence for this rule **IS NOT** required by default but is recommended.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | - asset_type=pipeline |

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| labels | ['app.kubernetes.io/instance'] |
