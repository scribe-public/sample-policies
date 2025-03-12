# Prevent Long-Lived Tokens  
**Type:** Rule  
**ID:** `bb-project-long-live-tokens`  
**Uses:** `bitbucket/project/long-live-tokens@v2/rules`  
**Source:** [v2/rules/bitbucket/project/long-live-tokens.yaml](https://github.com/scribe-public/sample-policies/v2/rules/bitbucket/project/long-live-tokens.yaml)  
**Rego Source:** [long-live-tokens.rego](https://github.com/scribe-public/sample-policies/v2/rules/bitbucket/project/long-live-tokens.rego)  
**Labels:** Bitbucket, Project  

Verify Bitbucket API tokens expire before the maximum time to live.

:::tip 
Rule Result will be set as 'open' if evidence is missing.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
his rule requires evaluation with a target; without one, the rule will be **disabled**.  
::: 

## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | - asset_type=project<br>- platform=bitbucket<br>- platform_instance=bitbucket_dc |

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| max_days | 30 |
