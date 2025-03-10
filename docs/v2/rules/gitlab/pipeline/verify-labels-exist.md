# Rule: GitLab pipeline verify labels exist  
**ID:** `gitlab-pipeline-verify-labels-exist`  
**Uses:** `gitlab/pipeline/verify-labels-exist@v2/rules`  
**Source:** [v2/rules/gitlab/pipeline/verify-labels-exist.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/pipeline/verify-labels-exist.yaml)  
**Rego Source:** [verify-labels-exist.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/pipeline/verify-labels-exist.rego)  
**Short Description:** Verify the pipeline has all required label keys and values.  
**Labels:** Gitlab, Pipeline  
> Evidence for this rule **IS NOT** required by default but is recommended


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
- app.kubernetes.io/instance
```

