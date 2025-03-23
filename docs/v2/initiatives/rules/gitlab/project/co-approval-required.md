---
sidebar_label: Require Code Owner Approval in GitLab Project
title: Require Code Owner Approval in GitLab Project
---  
# Require Code Owner Approval in GitLab Project  
**Type:** Rule  
**ID:** `gitlab-project-code-owner-approval`  
**Source:** [v2/rules/gitlab/project/co-approval-required.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/co-approval-required.yaml)  
**Rego Source:** [co-approval-required.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/co-approval-required.rego)  
**Labels:** Gitlab, Project  

Verify code owner approval is required for specific branches in the GitLab project.

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
uses: gitlab/project/co-approval-required@v2
with:
  branch: "main"
```

## Mitigation  
Require code owner approval for specific branches in the GitLab project to prevent unauthorized changes.


## Description  
This rule ensures that code owner approval is required for specific branches in the GitLab project.
It performs the following steps:

1. Checks the settings of the GitLab project.
2. Verifies that code owner approval is required for the specified branch.

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
| branch | string | True | The branch to require code owner approval. |

