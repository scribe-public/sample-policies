# Rule: Verify GitLab Pipeline Labels

**ID**: `gitlab-pipeline-verify-labels`  
**Source**: [v2/rules/gitlab/pipeline/verify-labels.yaml](scribe-public/sample-policies.git/v2/rules/gitlab/pipeline/verify-labels.yaml)  
**Rego File Path**: `verify-labels.rego`  

**Labels**: Gitlab, Pipeline

**Short Description**: Verify the pipeline includes all required label keys and values.

## Evidence Requirements

```yaml
signed: false
content_body_type: generic
target_type: data
predicate_type: http://scribesecurity.com/evidence/discovery/v0.1
labels:
- asset_type=pipeline
```
## Rule Parameters (`with`)

```yaml
labels:
  app.kubernetes.io/instance: defaul1t
```
