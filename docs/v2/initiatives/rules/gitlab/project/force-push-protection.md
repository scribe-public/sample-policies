---
sidebar_label: Disallow Force Push in GitLab Project
title: Disallow Force Push in GitLab Project
---  
# Disallow Force Push in GitLab Project  
**Type:** Rule  
**ID:** `gitlab-project-disallow-force-push`  
**Source:** [v2/rules/gitlab/project/force-push-protection.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/force-push-protection.yaml)  
**Rego Source:** [force-push-protection.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/force-push-protection.rego)  
**Labels:** Gitlab, Project  

Verify force pushes in the GitLab project are disallowed to maintain repository integrity.

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
uses: gitlab/project/force-push-protection@v2
with:
  branch: "main"
```

## Mitigation  
Ensure that force pushes in the GitLab project are disallowed to maintain repository integrity.


## Description  
This rule ensures that force pushes in the GitLab project are disallowed to maintain repository integrity.
It performs the following steps:

1. Checks the settings of the GitLab project.
2. Verifies that force pushes are disallowed.

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
| branch | string | False | The branch to disallow force pushes. |

