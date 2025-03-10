# Verify GitLab Pipeline Labels  
** Type:** Rule  
**ID:** `gitlab-pipeline-verify-labels`  
**Uses:** `gitlab/pipeline/verify-labels@v2/rules`  
**Source:** [v2/rules/gitlab/pipeline/verify-labels.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/pipeline/verify-labels.yaml)  
**Rego Source:** [verify-labels.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/pipeline/verify-labels.rego)  
**Labels:** Gitlab, Pipeline  

Verify the pipeline includes all required label keys and values.

> Evidence for this rule **IS NOT** required by default but is recommended.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | ['asset_type=pipeline'] |

## Rule Parameters (`with`)  
```yaml
labels:
  app.kubernetes.io/instance: defaul1t
```

