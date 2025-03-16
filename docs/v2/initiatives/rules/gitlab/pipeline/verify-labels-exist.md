---
sidebar_label: GitLab pipeline verify labels exist
title: GitLab pipeline verify labels exist
---  
# GitLab pipeline verify labels exist  
**Type:** Rule  
**ID:** `gitlab-pipeline-verify-labels-exist`  
**Source:** [v2/rules/gitlab/pipeline/verify-labels-exist.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/pipeline/verify-labels-exist.yaml)  
**Rego Source:** [verify-labels-exist.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/pipeline/verify-labels-exist.rego)  
**Labels:** Gitlab, Pipeline  

Verify the pipeline has all required label keys and values.

:::note 
This rule requires Discovery Evidence. See [here](https://deploy-preview-299--scribe-security.netlify.app/docs/platforms/discover) for more details.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 

## Usage example

```yaml
uses: gitlab/pipeline/verify-labels-exist@v2
```

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

