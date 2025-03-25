---
sidebar_label: Verify GitLab Pipeline Labels
title: Verify GitLab Pipeline Labels
---  
# Verify GitLab Pipeline Labels  
**Type:** Rule  
**ID:** `gitlab-pipeline-verify-labels`  
**Source:** [v2/rules/gitlab/pipeline/verify-labels.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/pipeline/verify-labels.yaml)  
**Rego Source:** [verify-labels.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/pipeline/verify-labels.rego)  
**Labels:** Gitlab, Pipeline  

Verify the pipeline includes all required label keys and values.

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
uses: gitlab/pipeline/verify-labels@v2
with:
  labels:
    app.kubernetes.io/instance: "defaul1t"
```

## Mitigation  
Ensure that all required labels exist in the pipeline to reduce the risk of misconfiguration.


## Description  
This rule ensures that the pipeline includes all required label keys and values.
It performs the following steps:

1. Checks the settings of the GitLab pipeline.
2. Verifies that all required labels exist in the pipeline.
2.1 Verify that all the label values match the expected values.

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
| labels | object | True | List of labels to verify exist in the pipeline. |

