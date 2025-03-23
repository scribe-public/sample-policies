---
sidebar_label: Verify members_can_create_repositories setting
title: Verify members_can_create_repositories setting
---  
# Verify members_can_create_repositories setting  
**Type:** Rule  
**ID:** `github-org-create-repos`  
**Source:** [v2/rules/github/org/create-repos.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/org/create-repos.yaml)  
**Rego Source:** [create-repos.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/org/create-repos.rego)  
**Labels:** GitHub, Organization  

Verify `members_can_create_repositories` is appropriately configured in the GitHub repository.

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
uses: github/org/create-repos@v2
with:
  desired_value: false
```

## Mitigation  
Ensures that only approved users can create repositories in the GitHub organization, reducing the risk of unauthorized repository creation.


## Description  
This rule ensures that only users specified in the allowed list can create repositories in the GitHub organization.
It performs the following steps:

1. Iterates over the users in the GitHub organization.
2. Checks each user's permissions to create repositories against the allowed list specified in the `with.allowed_users` configuration.
   - If a user not in the allowed list has permissions to create repositories, the rule flags it as a violation.

**Evidence Requirements:**
- Evidence must be provided by the Scribe Platform's CLI tool through scanning GitHub organization resources.

## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | - platform=github<br/>- asset_type=organization |

## Input Definitions  
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| desired_value | boolean | False | The desired value for the `members_can_create_repositories` setting. |

