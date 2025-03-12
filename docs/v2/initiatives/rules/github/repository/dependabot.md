---
sidebar_label: Verify Dependabot security updates setting
title: Verify Dependabot security updates setting
---  
# Verify Dependabot security updates setting  
**Type:** Rule  
**ID:** `github-repo-dependabot`  
**Uses:** `github/repository/dependabot@v2/rules`  
**Source:** [v2/rules/github/repository/dependabot.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/repository/dependabot.yaml)  
**Rego Source:** [dependabot.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/repository/dependabot.rego)  
**Labels:** GitHub, Repository  

Verify Dependabot security updates are configured in the GitHub repository.

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
| labels | - platform=github<br/>- asset_type=repository |

