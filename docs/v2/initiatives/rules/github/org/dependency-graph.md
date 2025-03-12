---
sidebar_label: Verify dependency_graph_enabled_for_new_repositories setting
title: Verify dependency_graph_enabled_for_new_repositories setting
---  
# Verify dependency_graph_enabled_for_new_repositories setting  
**Type:** Rule  
**ID:** `github-org-dependency-graph`  
**Uses:** `github/org/dependency-graph@v2/rules`  
**Source:** [v2/rules/github/org/dependency-graph.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/org/dependency-graph.yaml)  
**Rego Source:** [dependency-graph.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/org/dependency-graph.rego)  
**Labels:** GitHub, Organization  

Verify `dependency_graph` is enabled for new repositories in the GitHub organization.

:::note 
This rule requires Unsigned Github Organization Discovery Evidence.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 

## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | - platform=github<br/>- asset_type=organization |

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| desired_value | False |
