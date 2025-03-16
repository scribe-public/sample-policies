---
sidebar_label: Run SAST Scanning in GitLab Project
title: Run SAST Scanning in GitLab Project
---  
# Run SAST Scanning in GitLab Project  
**Type:** Rule  
**ID:** `gitlab-project-sast-scanning`  
**Source:** [v2/rules/gitlab/project/sast-scanning.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/sast-scanning.yaml)  
**Rego Source:** [sast-scanning.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/sast-scanning.rego)  
**Labels:** Gitlab, Project  

Verify SAST scanning is performed for the GitLab project.

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
uses: gitlab/project/sast-scanning@v2

## Usage example

```yaml
with: gitlab/project/sast-scanning@v2
```

## Mitigation  
Ensure that SAST scanning is performed for the GitLab project to prevent unauthorized changes.\



## Description  
This rule ensures that SAST scanning is performed for the GitLab project.
It performs the following steps:

1. Checks the settings of the GitLab project.
2. Verifies that SAST scanning is performed.

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

