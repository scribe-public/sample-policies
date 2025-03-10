# Restrict Build Scripts  
**Type:** Rule  
**ID:** `images-disallowed-build-script`  
**Uses:** `images/blocklist-build-scripts@v2/rules`  
**Source:** [v2/rules/images/blocklist-build-scripts.yaml](https://github.com/scribe-public/sample-policies/v2/rules/images/blocklist-build-scripts.yaml)  
**Rego Source:** [blocklist-build-scripts.rego](https://github.com/scribe-public/sample-policies/v2/rules/images/blocklist-build-scripts.rego)  
**Labels:** SBOM, Images  

Verify no build scripts commands appear in block list.


## Mitigation  
Prevents the execution of unauthorized or insecure build scripts during the image build process, reducing the risk of malicious command injection and ensuring a more secure supply chain.


> Rule Result will be set as 'open' if evidence is missing.  
> Signed Evidence for this rule **IS NOT** required by default but is recommended.  

## Description  
This rule inspects the SBOM (in CycloneDX JSON format) for each Layer component and specifically looks for a property named "CreatedBy". 
It then checks whether the value of this property contains any substrings specified in the 'blocklist' parameter. 
If a match is found, the rule generates a violation indicating that a disallowed build script command was used during the build process.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | cyclonedx-json |
| target_type | container |

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| blocklist | [] |
