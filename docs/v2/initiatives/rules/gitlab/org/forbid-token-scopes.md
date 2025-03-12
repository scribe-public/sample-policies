---
sidebar_label: Forbid Token Scopes in GitLab Organization
title: Forbid Token Scopes in GitLab Organization
---  
# Forbid Token Scopes in GitLab Organization  
**Type:** Rule  
**ID:** `gitlab-org-disallowed-token-scope`  
**Uses:** `gitlab/org/forbid-token-scopes@v2/rules`  
**Source:** [v2/rules/gitlab/org/forbid-token-scopes.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/org/forbid-token-scopes.yaml)  
**Rego Source:** [forbid-token-scopes.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/org/forbid-token-scopes.rego)  
**Labels:** Blueprint, Gitlab, Organization  

Verify no GitLab organization tokens have disallowed scopes.


## Mitigation  
Prevents the use of tokens with insecure or excessive scopes within the organization. This check reduces the risk of unauthorized actions by ensuring that only tokens with allowed scopes are used, while permitting trusted tokens via the approved tokens list.


:::tip 
Rule Result will be set as 'open' if evidence is missing.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 

## Description  
This rule examines evidence from a GitLab organization scan to ensure that tokens do not contain any disallowed scopes.
It iterates over each token in the evidence (under `input.evidence.predicate.content[*].token`), filtering for tokens 
that are active and not revoked. For each token, it checks whether any of its scopes match the forbidden list specified 
in `with.project_scopes`. If a token's scope matches a forbidden value and the token is not listed in `with.approved_tokens`,
a violation is recorded with details including the token name and the disallowed scope.

**Evidence Requirements:**
- Evidence must be provided in a generic format.
- The evidence should include token data with fields such as `result_object.revoked`, `result_object.active`, and `result_object.scopes`.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | - platform=gitlab<br/>- asset_type=organization |

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| project_scopes | ['write_api', 'write_repository'] |
| approved_tokens | [] |
