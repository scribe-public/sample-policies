# Rule: GitLab pipeline verify labels exist

**ID**: `gitlab-pipeline-verify-labels-exist`  
**Source**: [v2/rules/gitlab/pipeline/verify-labels-exist.yaml](scribe-public/sample-policies.git/v2/rules/gitlab/pipeline/verify-labels-exist.yaml)  
**Rego File Path**: `verify-labels-exist.rego`  

**Labels**: Gitlab, Pipeline

**Short Description**: Verify the pipeline has all required label keys and values.

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
- app.kubernetes.io/instance
```
