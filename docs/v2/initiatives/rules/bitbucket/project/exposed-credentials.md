---
sidebar_label: Prevent Credential Exposure
title: Prevent Credential Exposure
---  
# Prevent Credential Exposure  
**Type:** Rule  
**ID:** `bb-project-exposed-credentials`  
**Source:** [v2/rules/bitbucket/project/exposed-credentials.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/bitbucket/project/exposed-credentials.yaml)  
**Rego Source:** [exposed-credentials.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/bitbucket/project/exposed-credentials.rego)  
**Labels:** Bitbucket, Project  

Verify access to the Bitbucket project is blocked if exposed credentials are detected.

:::note 
This rule requires Bitbucket Project Discovery Evidence. See [here](https://deploy-preview-299--scribe-security.netlify.app/docs/platforms/discover#bitbucket-discovery) for more details.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 

## Usage example

```yaml
uses: bitbucket/project/exposed-credentials@v2
```

## Mitigation  
Ensure that access to the Bitbucket project is blocked if exposed credentials are detected to prevent unauthorized access.


## Description  
This rule ensures that access to the Bitbucket project is blocked if exposed credentials are detected.
It performs the following steps:

1. Checks the settings of the Bitbucket project.
2. Verifies that access is blocked if exposed credentials are detected.

**Evidence Requirements:**
- Evidence must be provided by the Scribe Platform's CLI tool through scanning Bitbucket project resources.

## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | - platform=bitbucket<br/>- asset_type=project |

