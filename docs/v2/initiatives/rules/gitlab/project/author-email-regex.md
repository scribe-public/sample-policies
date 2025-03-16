---
sidebar_label: Set Author Email Regex in GitLab Project
title: Set Author Email Regex in GitLab Project
---  
# Set Author Email Regex in GitLab Project  
**Type:** Rule  
**ID:** `gitlab-project-author-email-regex`  
**Source:** [v2/rules/gitlab/project/author-email-regex.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/author-email-regex.yaml)  
**Rego Source:** [author-email-regex.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/author-email-regex.rego)  
**Labels:** Gitlab, Project  

Verify the `author_email_regex` for the GitLab project is set to the specified value.

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
uses: gitlab/project/author-email-regex@v2
with:
  author_email_regex: ".*@mycompany.com"
  
```

## Mitigation  
Ensure that the Author Email reduces the risk of unauthorized access by setting the `author_email_regex` field to the specified value.


## Description  
This rule ensures that the `author_email_regex` for the GitLab project is set to the specified value.
It performs the following steps:

1. Checks the settings of the GitLab project.
2. Verifies that the Author Email matches the 'author_email_regex' field.

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
| author_email_regex | string | False | The regular expression for the author email. |

