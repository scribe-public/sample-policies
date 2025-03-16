---
sidebar_label: Verify GitHub Organization Secrets Are Not Too Old
title: Verify GitHub Organization Secrets Are Not Too Old
---  
# Verify GitHub Organization Secrets Are Not Too Old  
**Type:** Rule  
**ID:** `github-org-old-secrets`  
**Source:** [v2/rules/github/org/old-secrets.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/org/old-secrets.yaml)  
**Rego Source:** [old-secrets.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/org/old-secrets.rego)  
**Labels:** GitHub, Organization  

Verify secrets in the GitHub organization are not older than the specified threshold.

:::note 
This rule requires Github Organization Discovery Evidence. See [here](https://deploy-preview-299--scribe-security.netlify.app/docs/platforms/discover#github-discovery) for more details.  
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

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| max_secret_age | 12 |

