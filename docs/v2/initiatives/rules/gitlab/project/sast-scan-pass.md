---
sidebar_label: Ensure SAST Scanning Passes
title: Ensure SAST Scanning Passes
---  
# Ensure SAST Scanning Passes  
**Type:** Rule  
**ID:** `gitlab-project-sast-scan-pass`  
**Source:** [v2/rules/gitlab/project/sast-scan-pass.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/sast-scan-pass.yaml)  
**Rego Source:** [sast-scan-pass.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/sast-scan-pass.rego)  
**Labels:** Gitlab, Project  

Verify SAST scanning is successful for the GitLab project.

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
uses: gitlab/project/sast-scan-pass@v2/rules
```

## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | - platform=gitlab<br/>- asset_type=project |

