---
sidebar_label: Enable Secrets Prevention in GitLab Project
title: Enable Secrets Prevention in GitLab Project
---  
# Enable Secrets Prevention in GitLab Project  
**Type:** Rule  
**ID:** `gitlab-project-verify-prevent_secrets`  
**Source:** [v2/rules/gitlab/project/prevent-secrets-check.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/prevent-secrets-check.yaml)  
**Rego Source:** [prevent-secrets-check.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/prevent-secrets-check.rego)  
**Labels:** Gitlab, Project  

Verify `prevent_secrets` is enabled for the GitLab project.

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
uses: gitlab/project/prevent-secrets-check@v2

## Usage example

```yaml
with: gitlab/project/prevent-secrets-check@v2
```

## Mitigation  
Ensure that Secrets Prevention is enabled for the GitLab project to prevent unauthorized changes.


## Description  
This rule ensures that `prevent_secrets` is enabled for the GitLab project.
It performs the following steps:

1. Checks the settings of the GitLab project.
2. Verifies that `prevent_secrets` is enabled.

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

