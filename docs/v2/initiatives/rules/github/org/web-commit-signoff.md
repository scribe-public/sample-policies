---
sidebar_label: Verify GitHub Organization Requires Signoff on Web Commits
title: Verify GitHub Organization Requires Signoff on Web Commits
---  
# Verify GitHub Organization Requires Signoff on Web Commits  
**Type:** Rule  
**ID:** `github-org-web-commit-signoff`  
**Uses:** `github/org/web-commit-signoff@v2/rules`  
**Source:** [v2/rules/github/org/web-commit-signoff.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/org/web-commit-signoff.yaml)  
**Rego Source:** [web-commit-signoff.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/org/web-commit-signoff.rego)  
**Labels:** GitHub, Organization  

Verify contributors sign commits through the GitHub web interface.

:::note 
This rule requires [Github Organization Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery).  
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
| labels | - platform=github<br/>- asset_type=organization |

