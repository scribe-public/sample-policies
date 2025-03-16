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
with:
  labels:
    - "app.kubernetes.io/instance"
  
```

## Mitigation  
Ensure that all required labels exist in the pipeline to reduce the risk of misconfiguration.


## Description  
This rule ensures that the pipeline has all required label keys and values.
It performs the following steps:

1. Checks the settings of the GitLab pipeline.
2. Verifies that all required labels exist in the pipeline.

**Evidence Requirements:**
- Evidence must be provided by the Scribe Platform's CLI tool through scanning GitLab pipeline resources.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | - asset_type=pipeline |

## Input Definitions  
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| labels | array | True | List of labels to verify exist in the pipeline. |

