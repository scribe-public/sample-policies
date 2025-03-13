---
sidebar_label: Allowed Commit Authors in GitLab Project
title: Allowed Commit Authors in GitLab Project
---  
# Allowed Commit Authors in GitLab Project  
**Type:** Rule  
**ID:** `gitlab-project-allowed-commit-author-names`  
**Uses:** `gitlab/project/commit-author-name-check@v2/rules`  
**Source:** [v2/rules/gitlab/project/commit-author-name-check.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/commit-author-name-check.yaml)  
**Rego Source:** [commit-author-name-check.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/commit-author-name-check.rego)  
**Labels:** Gitlab, Project  

Verify only users in the Allowed List author commits in the GitLab project.

:::note 
This rule requires Gitlab Project Discovery Evidence. See [here](https://scribe-security.netlify.app/platforms/discover#gitlab-discovery) for more details.  
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
| labels | - platform=gitlab<br/>- asset_type=project |

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| allowed_authors | ['examplename'] |

