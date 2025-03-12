---
sidebar_label: Required Trivy Evidence Exists
title: Required Trivy Evidence Exists
---  
# Required Trivy Evidence Exists  
**Type:** Rule  
**ID:** `required-trivy-evidence`  
**Uses:** `generic/trivy-exists@v2/rules`  
**Source:** [v2/rules/generic/trivy-exists.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/generic/trivy-exists.yaml)  
**Labels:** 3rd-party  

Verify required Trivy evidence exists

:::note 
This rule requires Generic Statement.  
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
| content_body_type | generic |
| target_type | data |
| predicate_type | https://aquasecurity.github.io/trivy/v0.42/docs/configuration/reporting/#json |

