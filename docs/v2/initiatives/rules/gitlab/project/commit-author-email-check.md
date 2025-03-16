---
sidebar_label: Restrict Commit Authors in GitLab Project
title: Restrict Commit Authors in GitLab Project
---  
# Restrict Commit Authors in GitLab Project  
**Type:** Rule  
**ID:** `gitlab-project-allowed-commit-authors`  
**Source:** [v2/rules/gitlab/project/commit-author-email-check.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/commit-author-email-check.yaml)  
**Rego Source:** [commit-author-email-check.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/commit-author-email-check.rego)  
**Labels:** Gitlab, Project  

Verify only GitLab project users in the Allowed List have commit author permissions.

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
uses: gitlab/project/commit-author-email-check@v2
with:
  allowed_authors:
    - mail@example.com
    - mail2@example.com
  
```

## Mitigation  
Ensure that only users in the Allowed List have commit author permissions in the GitLab project to prevent unauthorized changes.


## Description  
This rule ensures that only users in the Allowed List have commit author permissions in the GitLab project.
It performs the following steps:

1. Checks the settings of the GitLab project.
2. Verifies that only users in the Allowed List have commit author permissions.

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
| allowed_authors | array | False | List of users allowed to have commit author permissions in the GitLab project. |

