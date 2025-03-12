---
sidebar_label: Ensure Secrets Scanning Passes
title: Ensure Secrets Scanning Passes
---  
# Ensure Secrets Scanning Passes  
**Type:** Rule  
**ID:** `gitlab-project-secrets-scan-pass`  
**Uses:** `gitlab/project/secrets-scan-pass@v2/rules`  
**Source:** [v2/rules/gitlab/project/secrets-scan-pass.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/secrets-scan-pass.yaml)  
**Rego Source:** [secrets-scan-pass.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/secrets-scan-pass.rego)  
**Labels:** Gitlab, Project  

Verify secrets scanning is successful for the GitLab project.

:::tip 
Rule Result will be set as 'open' if evidence is missing.  
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
| labels | - platform=gitlab<br/>- asset_type=project |

