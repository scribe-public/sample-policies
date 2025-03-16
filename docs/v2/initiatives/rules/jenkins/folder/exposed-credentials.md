---
sidebar_label: Verify Exposed Credentials
title: Verify Exposed Credentials
---  
# Verify Exposed Credentials  
**Type:** Rule  
**ID:** `jenkins-exposed-credentials`  
**Source:** [v2/rules/jenkins/folder/exposed-credentials.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/jenkins/folder/exposed-credentials.yaml)  
**Rego Source:** [exposed-credentials.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/jenkins/folder/exposed-credentials.rego)  
**Labels:** Jenkins, Folder  

Verify there are no exposed credentials.

:::note 
This rule requires Discovery Evidence. See [here](https://deploy-preview-299--scribe-security.netlify.app/docs/platforms/discover) for more details.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 

## Usage example

```yaml
uses: jenkins/folder/exposed-credentials@v2

## Usage example

```yaml
with: jenkins/folder/exposed-credentials@v2
```

## Mitigation  
Ensure that there are no exposed credentials in the Jenkins folder to reduce the risk of unauthorized access.


## Description  
This rule ensures that there are no exposed credentials in the Jenkins folder.
It performs the following steps:

1. Checks the Jenkins folder for exposed credentials.
2. Verifies that there are no exposed credentials.

**Evidence Requirements:**
- Evidence must be provided by the Scribe Platform's CLI tool through scanning Jenkins folder resources.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | - asset_type=folder |

