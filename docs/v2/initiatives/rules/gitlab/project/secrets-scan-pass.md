---
sidebar_label: Ensure Secrets Scanning Passes
title: Ensure Secrets Scanning Passes
---  
# Ensure Secrets Scanning Passes  
**Type:** Rule  
**ID:** `gitlab-project-secrets-scan-pass`  
**Source:** [v2/rules/gitlab/project/secrets-scan-pass.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/secrets-scan-pass.yaml)  
**Rego Source:** [secrets-scan-pass.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/secrets-scan-pass.rego)  
**Labels:** Gitlab, Project  

Verify secrets scanning is successful for the GitLab project.

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
uses: gitlab/project/secrets-scan-pass@v2

## Usage example

```yaml
with: gitlab/project/secrets-scan-pass@v2
```

## Mitigation  
Ensure that secrets scanning is successful for the GitLab project to prevent unauthorized changes.


## Description  
This rule ensures that secrets scanning is successful for the GitLab project.
It performs the following steps:

1. Checks the settings of the GitLab project.
2. Verifies that secrets scanning is successful.

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

