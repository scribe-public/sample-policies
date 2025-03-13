---
sidebar_label: Verify GitLab Pipeline Labels
title: Verify GitLab Pipeline Labels
---  
# Verify GitLab Pipeline Labels  
**Type:** Rule  
**ID:** `gitlab-pipeline-verify-labels`  
**Uses:** `gitlab/pipeline/verify-labels@v2/rules`  
**Source:** [v2/rules/gitlab/pipeline/verify-labels.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/pipeline/verify-labels.yaml)  
**Rego Source:** [verify-labels.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/pipeline/verify-labels.rego)  
**Labels:** Gitlab, Pipeline  

Verify the pipeline includes all required label keys and values.

:::note 
This rule requires Discovery Evidence. See [here](https://deploy-preview-299--scribe-security.netlify.app/platforms/discover) for more details.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 

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
| labels | `{'app.kubernetes.io/instance': 'defaul1t'}` |

