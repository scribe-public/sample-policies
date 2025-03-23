---
sidebar_label: Require Minimal Approvers in GitLab Project
title: Require Minimal Approvers in GitLab Project
---  
# Require Minimal Approvers in GitLab Project  
**Type:** Rule  
**ID:** `gitlab-project-required-minimal-approvers`  
**Source:** [v2/rules/gitlab/project/required-minimal-approvers.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/required-minimal-approvers.yaml)  
**Rego Source:** [required-minimal-approvers.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/required-minimal-approvers.rego)  
**Labels:** Gitlab, Project  

Verify the required number of approvers for the GitLab project is met.

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
uses: gitlab/project/required-minimal-approvers@v2
```

## Mitigation  
Ensure that the required number of approvers for the GitLab project is met to prevent unauthorized changes.


## Description  
This rule ensures that the required number of approvers for the GitLab project is met.
It performs the following steps:

1. Checks the settings of the GitLab project.
2. Verifies that the required number of approvers is met.

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

