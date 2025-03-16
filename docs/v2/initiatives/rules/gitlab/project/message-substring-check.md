---
sidebar_label: Check Message Substring
title: Check Message Substring
---  
# Check Message Substring  
**Type:** Rule  
**ID:** `gitlab-project-message-substring-check`  
**Source:** [v2/rules/gitlab/project/message-substring-check.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/message-substring-check.yaml)  
**Rego Source:** [message-substring-check.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/message-substring-check.rego)  
**Labels:** Gitlab, Project  

Verify a specific substring is not found in the message attribute of vulnerabilities for the GitLab project.

:::note 
This rule requires Gitlab Project Discovery Evidence. See [here](https://deploy-preview-299--scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) for more details.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 

## Usage example

```yaml
uses: gitlab/project/message-substring-check@v2
with:
  pattern: "(?i)dghd"
  
```

## Mitigation  
Ensure that the specified substring is not found in the message attribute of vulnerabilities for the GitLab project to prevent unauthorized changes.


## Description  
This rule ensures that a specific substring is not found in the message attribute of vulnerabilities for the GitLab project.
It performs the following steps:

1. Checks the settings of the GitLab project.
2. Verifies that the specified substring is not found in the message attribute of vulnerabilities.

**Evidence Requirements:**
- Evidence must be provided by the Scribe Platform's CLI tool through scanning GitLab project resources.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | - platform=gitlab<br/>- asset_type=project |

## Input Definitions  
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| pattern | string | True | The pattern to search for in the message attribute of vulnerabilities. |

