---
sidebar_label: Restrict Public Visibility in GitLab Organization
title: Restrict Public Visibility in GitLab Organization
---  
# Restrict Public Visibility in GitLab Organization  
**Type:** Rule  
**ID:** `gitlab-org-allowed-visible-projects`  
**Source:** [v2/rules/gitlab/org/projects-visibility.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/org/projects-visibility.yaml)  
**Rego Source:** [projects-visibility.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/org/projects-visibility.rego)  
**Labels:** Gitlab, Organization  

Verify only allowed projects in the GitLab organization have public visibility.

:::note 
This rule requires Gitlab Organization Discovery Evidence. See [here](https://deploy-preview-299--scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) for more details.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 

## Usage example

```yaml
uses: gitlab/org/projects-visibility@v2
with:
  allowed_public:
    - "Learn GitLab"
    - "Scribe Gitlab Test"
  
```

## Description  
This rule ensures that only allowed projects in the GitLab organization have public visibility.
It performs the following steps:

1. Checks the settings of the GitLab organization.
2. Verifies that only allowed projects have public visibility.

**Evidence Requirements:**
- Evidence must be provided by the Scribe Platform's CLI tool through scanning GitLab organization resources.

## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | - platform=gitlab<br/>- asset_type=organization |

## Input Definitions  
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| allowed_public | array | False | List of projects allowed to have public visibility in the GitLab organization. |

