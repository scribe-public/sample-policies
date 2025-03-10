# Rule: Verify GitLab Pipeline Labels

**ID**: `gitlab-pipeline-verify-labels`
**Source**: [v2/rules/gitlab/pipeline/verify-labels.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/pipeline/verify-labels.yaml)
**Uses**: `gitlab/pipeline/verify-labels@v2/rules
**Rego Source**: [verify-labels.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/pipeline/verify-labels.rego)

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
