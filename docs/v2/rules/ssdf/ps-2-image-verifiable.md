# Image-verifiable  
**Type:** Rule  
**ID:** `PS.2`  
**Uses:** `ssdf/ps-2-image-verifiable@v2/rules`  
**Source:** [v2/rules/ssdf/ps-2-image-verifiable.yaml](https://github.com/scribe-public/sample-policies/v2/rules/ssdf/ps-2-image-verifiable.yaml)  
**Labels:** SSDF  

PS.2 Provide a mechanism to verify the integrity of the image


## Mitigation  
Ensures container images are cryptographically verifiable, preventing tampering and confirming their authenticity.


> Rule Result will be set as 'open' if evidence is missing.  
> Signed Evidence for this rule **IS NOT** required by default but is recommended.  

## Evidence Requirements  
| Field | Value |
|-------|-------|
| target_type | container |

