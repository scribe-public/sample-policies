# Blocklist Container User  
**Type:** Rule  
**ID:** `images-blocklist-user`  
**Uses:** `images/blocklist-user@v2/rules`  
**Source:** [v2/rules/images/blocklist-user.yaml](https://github.com/scribe-public/sample-policies/v2/rules/images/blocklist-user.yaml)  
**Rego Source:** [blocklist-user.rego](https://github.com/scribe-public/sample-policies/v2/rules/images/blocklist-user.rego)  
**Labels:** SBOM, Images  

Ensures that the container image does not use a user in the blocklist.
We look for a SBOM property named "user" in metadata.component.properties. 
If it matches any username from the 'users' list, we fail.


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
| content_body_type | cyclonedx-json |
| target_type | container |

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| users | [] |
