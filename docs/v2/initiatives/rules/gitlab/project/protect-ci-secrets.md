---
sidebar_label: Protect CI Secrets in GitLab Project
title: Protect CI Secrets in GitLab Project
---  
# Protect CI Secrets in GitLab Project  
**Type:** Rule  
**ID:** `gitlab-project-protect-ci-secrets`  
**Source:** [v2/rules/gitlab/project/protect-ci-secrets.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/protect-ci-secrets.yaml)  
**Rego Source:** [protect-ci-secrets.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/protect-ci-secrets.rego)  
**Labels:** Gitlab, Project  

Verify secrets in the GitLab project are not shared.

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
uses: gitlab/project/protect-ci-secrets@v2
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
| pattern | (?i)(token|secret) |

