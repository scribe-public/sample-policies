---
sidebar_label: Validate All Commits in GitLab Project
title: Validate All Commits in GitLab Project
---  
# Validate All Commits in GitLab Project  
**Type:** Rule  
**ID:** `gitlab-project-all-commits-validated`  
**Source:** [v2/rules/gitlab/project/commits-validated.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/commits-validated.yaml)  
**Rego Source:** [commits-validated.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/commits-validated.rego)  
**Labels:** Gitlab, Project  

Verify all commits in the GitLab project are validated.

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
uses: gitlab/project/commits-validated@v2
```

## Mitigation  
Ensure that all commits in the GitLab project are validated to prevent unauthorized changes.


## Description  
This rule ensures that all commits in the GitLab project are validated.
It performs the following steps:

1. Checks the settings of the GitLab project.
2. Verifies that all commits are validated.

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

