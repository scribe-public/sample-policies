# Image-verifiable  
**Type:** Rule  
**ID:** `PS.2`  
**Uses:** `ssdf/ps-2-image-verifiable@v2/rules`  
**Source:** [v2/rules/ssdf/ps-2-image-verifiable.yaml](https://github.com/scribe-public/sample-policies/v2/rules/ssdf/ps-2-image-verifiable.yaml)  
**Labels:** SSDF  

PS.2 Provide a mechanism to verify the integrity of the image


## Mitigation  
Ensures container images are cryptographically verifiable, preventing tampering and confirming their authenticity.


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
| target_type | container |

