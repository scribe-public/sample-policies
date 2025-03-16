---
sidebar_label: Verify Inactive Users
title: Verify Inactive Users
---  
# Verify Inactive Users  
**Type:** Rule  
**ID:** `jenkins-inactive-users`  
**Source:** [v2/rules/jenkins/instance/inactive-users.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/jenkins/instance/inactive-users.yaml)  
**Rego Source:** [inactive-users.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/jenkins/instance/inactive-users.rego)  
**Labels:** Jenkins, Instance  

Verify there are no inactive users.

:::note 
This rule requires Jenkins Instance Discovery Evidence. See [here](https://deploy-preview-299--scribe-security.netlify.app/docs/platforms/discover#jenkins-discovery) for more details.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 

## Usage example

```yaml
uses: jenkins/instance/inactive-users@v2
with:
  inactive_for_days: 90
  
```

## Mitigation  
Ensure that no Jenkins instance users are inactive to prevent service disruption.


## Description  
This rule ensures that no Jenkins instance users are inactive.
It performs the following steps:

1. Checks the settings of the Jenkins instance.
2. Verifies that no users are inactive.

**Evidence Requirements:**
- Evidence must be provided by the Scribe Platform's CLI tool through scanning Jenkins instance resources.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | - asset_type=instance<br/>- platform=jenkins |

## Input Definitions  
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| inactive_for_days | number | False | Number of days before a user is considered inactive. |

