---
sidebar_label: Verify Dependency Graph Enabled
title: Verify Dependency Graph Enabled
---  
# Verify Dependency Graph Enabled  
**Type:** Rule  
**ID:** `github-org-dependency-graph`  
**Source:** [v2/rules/github/org/dependency-graph.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/org/dependency-graph.yaml)  
**Rego Source:** [dependency-graph.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/org/dependency-graph.rego)  
**Labels:** GitHub, Organization  

Verify that the dependency graph is enabled in the GitHub organization.

:::note 
This rule requires Github Organization Discovery Evidence. See [here](https://deploy-preview-299--scribe-security.netlify.app/docs/platforms/discover#github-discovery) for more details.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 

## Usage example

```yaml
uses: github/org/dependency-graph@v2
with:
  desired_value: true
  
```

## Mitigation  
Ensures that the dependency graph is enabled in the GitHub organization, providing better visibility into dependencies and potential vulnerabilities.



## Description  
This rule ensures that the dependency graph is enabled in the GitHub organization.
It performs the following steps:

1. Checks the settings of the GitHub organization.
2. Verifies that the dependency graph setting is enabled.

**Evidence Requirements:**
- Evidence must be provided by the Scribe Platform's CLI tool through scanning GitHub organization resources.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | - platform=github<br/>- asset_type=organization |

## Input Definitions  
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| desired_value | boolean | False | Indicates if the dependency graph is enabled. |

