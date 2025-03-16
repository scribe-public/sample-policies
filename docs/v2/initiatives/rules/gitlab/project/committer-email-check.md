---
sidebar_label: Allowed Committer Emails in GitLab Project
title: Allowed Committer Emails in GitLab Project
---  
# Allowed Committer Emails in GitLab Project  
**Type:** Rule  
**ID:** `gitlab-project-allowed-committer-emails`  
**Source:** [v2/rules/gitlab/project/committer-email-check.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/committer-email-check.yaml)  
**Rego Source:** [committer-email-check.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/committer-email-check.rego)  
**Labels:** Gitlab, Project  

Verify only users in the Allowed List use committer email addresses in the GitLab project.

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
uses: gitlab/project/committer-email-check@v2
with:
  allowed_committers:
    - mail@example.com
  
```

## Mitigation  
Ensure that only users in the Allowed List use committer email addresses in the GitLab project to prevent unauthorized changes.


## Description  
This rule ensures that only users in the Allowed List use committer email addresses in the GitLab project.
It performs the following steps:

1. Checks the settings of the GitLab project.
2. Verifies that only users in the Allowed List use committer email addresses.

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
| allowed_committers | array | False | List of email addresses allowed to use committer email addresses in the GitLab project. |

