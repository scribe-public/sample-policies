---
sidebar_label: Allowed Committer Emails in GitLab Project
title: Allowed Committer Emails in GitLab Project
---  
# Allowed Committer Emails in GitLab Project  
**Type:** Rule  
**ID:** `gitlab-project-allowed-committer-emails`  
**Uses:** `gitlab/project/committer-email-check@v2/rules`  
**Source:** [v2/rules/gitlab/project/committer-email-check.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/committer-email-check.yaml)  
**Rego Source:** [committer-email-check.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/gitlab/project/committer-email-check.rego)  
**Labels:** Gitlab, Project  

Verify only users in the Allowed List use committer email addresses in the GitLab project.

:::note 
This rule requires [Gitlab Project Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery).  
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
| allowed_committers | ['mail@example.com'] |

