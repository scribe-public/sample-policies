---
sidebar_label: Forbid Long-Lived Tokens in GitLab Organization
title: Forbid Long-Lived Tokens in GitLab Organization
---  
# Forbid Long-Lived Tokens in GitLab Organization  
**Type:** Rule  
**ID:** `gitlab-org-token-excessive-lifespan`  
**Source:** [v2/rules/gitlab/org/longlive-tokens.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/org/longlive-tokens.yaml)  
**Rego Source:** [longlive-tokens.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/org/longlive-tokens.rego)  
**Labels:** Blueprint, Gitlab, Organization  

Verify no GitLab organization tokens have an excessively long lifespan.

:::note 
This rule requires Gitlab Organization Discovery Evidence. See [here](https://deploy-preview-299--scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) for more details.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 

## Usage example

```yaml
uses: gitlab/org/longlive-tokens@v2
with:
  exiring_in_days: 365
```

## Mitigation  
Ensure that no GitLab organization tokens have an excessively long lifespan to prevent service disruption.


## Description  
This rule ensures that no GitLab organization tokens have an excessively long lifespan.
It performs the following steps:

1. Checks the settings of the GitLab organization.
2. Verifies that no tokens have an excessively long lifespan.

**Evidence Requirements:**
- Evidence must be provided by the Scribe Platform's CLI tool through scanning GitLab organization resources.

## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | - platform=gitlab<br/>- asset_type=organization |

## Input Definitions  
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| exiring_in_days | number | False | Number of days before a token expires. |

