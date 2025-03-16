---
sidebar_label: Verify Repo Visibility Setting
title: Verify Repo Visibility Setting
---  
# Verify Repo Visibility Setting  
**Type:** Rule  
**ID:** `github-org-repo-visibility`  
**Source:** [v2/rules/github/org/repo-visibility.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/org/repo-visibility.yaml)  
**Rego Source:** [repo-visibility.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/github/org/repo-visibility.rego)  
**Labels:** GitHub, Organization  

Verify only repositories in the Allowed List are public in the GitHub organization.

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
uses: github/org/repo-visibility@v2
```

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
| allowed_repo_names | [] |

