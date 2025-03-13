---
sidebar_label: Image-verifiable
title: Image-verifiable
---  
# Image-verifiable  
**Type:** Rule  
**ID:** `PS.2`  
**Uses:** `ssdf/ps-2-image-verifiable@v2/rules`  
**Source:** [v2/rules/ssdf/ps-2-image-verifiable.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/ssdf/ps-2-image-verifiable.yaml)  
**Labels:** SSDF  

PS.2 Provide a mechanism to verify the integrity of the image

:::note 
This rule requires Statement. See [here](https://scribe-security.netlify.app/docs/valint/generic) for more details.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 

## Mitigation  
Ensures container images are cryptographically verifiable, preventing tampering and confirming their authenticity.



## Evidence Requirements  
| Field | Value |
|-------|-------|
| target_type | container |

