---
sidebar_label: Check Message Substring
title: Check Message Substring
---  
# Check Message Substring  
**Type:** Rule  
**ID:** `gitlab-project-message-substring-check`  
**Source:** [v2/rules/gitlab/project/message-substring-check.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/message-substring-check.yaml)  
**Rego Source:** [message-substring-check.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/message-substring-check.rego)  
**Labels:** Gitlab, Project  

Verify a specific substring is not found in the message attribute of vulnerabilities for the GitLab project.

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
uses: gitlab/project/message-substring-check@v2
```

## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | - platform=gitlab<br/>- asset_type=project |

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| pattern | (?i)dghd |

