---
sidebar_label: SARIF Update Needed
title: SARIF Update Needed
---  
# SARIF Update Needed  
**Type:** Rule  
**ID:** `sarif-update-needed`  
**Source:** [v2/rules/sarif/patcheck/updates-needed.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/sarif/patcheck/updates-needed.yaml)  
**Rego Source:** [updates-needed.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/sarif/patcheck/updates-needed.rego)  
**Labels:** SARIF  

Verify no security packages require updates.

:::note 
This rule requires SARIF Evidence. See [here](https://deploy-preview-299--scribe-security.netlify.app/docs/valint/sarif) for more details.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 

## Usage example

```yaml
uses: sarif/patcheck/updates-needed@v2

## Usage example

```yaml
with: sarif/patcheck/updates-needed@v2
```

## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://docs.oasis-open.org/sarif/sarif/2.1.0 |

