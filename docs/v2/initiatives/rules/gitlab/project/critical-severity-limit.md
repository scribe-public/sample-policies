---
sidebar_label: Enforce Critical Severity Limit
title: Enforce Critical Severity Limit
---  
# Enforce Critical Severity Limit  
**Type:** Rule  
**ID:** `gitlab-project-critical-severity-limit`  
**Source:** [v2/rules/gitlab/project/critical-severity-limit.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/critical-severity-limit.yaml)  
**Rego Source:** [critical-severity-limit.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/critical-severity-limit.rego)  
**Labels:** Gitlab, Project  

Verify the maximum allowed critical severity alerts for the GitLab project.

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
uses: gitlab/project/critical-severity-limit@v2
with:
  max_allowed_vulnerability_count: 0
  
```

## Mitigation  
Ensure that the maximum allowed critical severity alerts for the GitLab project is enforced to prevent unauthorized changes.


## Description  
This rule ensures that the maximum allowed critical severity alerts for the GitLab project is enforced.
It performs the following steps:

1. Checks the settings of the GitLab project.
2. Verifies that the maximum allowed critical severity alerts is enforced.

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
| max_allowed_vulnerability_count | number | False | Maximum allowed critical severity alerts for the GitLab project. |

