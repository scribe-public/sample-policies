---
sidebar_label: Verify Secret_Scanning Setting in Security_And_Analysis
title: Verify Secret_Scanning Setting in Security_And_Analysis
---  
# Verify Secret_Scanning Setting in Security_And_Analysis  
**Type:** Rule  
**ID:** `github-org-secret-scanning-sa`  
**Uses:** `github/org/secret-scanning-sa@v2/rules`  
**Source:** [v2/rules/github/org/secret-scanning-sa.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/org/secret-scanning-sa.yaml)  
**Rego Source:** [secret-scanning-sa.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/org/secret-scanning-sa.rego)  
**Labels:** GitHub, Organization  

Verify `secret_scanning` is configured in the GitHub repository.

:::note 
This rule requires Github Organization Discovery Evidence. See [here](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) for more details.  
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

