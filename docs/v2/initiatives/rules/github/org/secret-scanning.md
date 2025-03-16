---
sidebar_label: Verify secret_scanning_enabled_for_new_repositories setting
title: Verify secret_scanning_enabled_for_new_repositories setting
---  
# Verify secret_scanning_enabled_for_new_repositories setting  
**Type:** Rule  
**ID:** `github-org-secret-scanning`  
**Source:** [v2/rules/github/org/secret-scanning.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/org/secret-scanning.yaml)  
**Rego Source:** [secret-scanning.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/org/secret-scanning.rego)  
**Labels:** GitHub, Organization  

Verify `secret_scanning` is enabled for new repositories in the GitHub organization.

:::note 
This rule requires Github Organization Discovery Evidence. See [here](https://deploy-preview-299--scribe-security.netlify.app/docs/platforms/discover#github-discovery) for more details.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 

## Usage example

```yaml
uses: github/org/secret-scanning@v2
```

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
| desired_value | False |

