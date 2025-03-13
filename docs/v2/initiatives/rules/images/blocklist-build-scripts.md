---
sidebar_label: Restrict Build Scripts
title: Restrict Build Scripts
---  
# Restrict Build Scripts  
**Type:** Rule  
**ID:** `images-disallowed-build-script`  
**Uses:** `images/blocklist-build-scripts@v2/rules`  
**Source:** [v2/rules/images/blocklist-build-scripts.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/images/blocklist-build-scripts.yaml)  
**Rego Source:** [blocklist-build-scripts.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/images/blocklist-build-scripts.rego)  
**Labels:** SBOM, Images  

Verify no build scripts commands appear in block list.

:::note 
This rule requires Image SBOM. See [here](https://scribe-security.netlify.app/docs/valint/sbom) for more details.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 

## Mitigation  
Prevents the execution of unauthorized or insecure build scripts during the image build process, reducing the risk of malicious command injection and ensuring a more secure supply chain.



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

## Input Definitions  
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| blocklist | array | False | A list of disallowed build script commands. Each entry should be a string representing a command or substring. |

