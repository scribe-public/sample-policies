---
sidebar_label: Allowed Public Repositories
title: Allowed Public Repositories
---  
# Allowed Public Repositories  
**Type:** Rule  
**ID:** `github-repo-visibility`  
**Source:** [v2/rules/github/repository/visibility.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/repository/visibility.yaml)  
**Rego Source:** [visibility.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/repository/visibility.rego)  
**Labels:** GitHub, Repository  

Verify only GitHub repositories in the Allowed List are public.

:::note 
This rule requires Github Repository Discovery Evidence. See [here](https://deploy-preview-299--scribe-security.netlify.app/docs/platforms/discover#github-discovery) for more details.  
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

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| allowed_repo_names | [] |

