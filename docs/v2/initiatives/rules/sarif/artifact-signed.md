---
sidebar_label: Verify Artifact Signature Using SARIF Report
title: Verify Artifact Signature Using SARIF Report
---  
# Verify Artifact Signature Using SARIF Report  
**Type:** Rule  
**ID:** `sarif-artifact-signed`  
**Uses:** `sarif/artifact-signed@v2/rules`  
**Source:** [v2/rules/sarif/artifact-signed.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/sarif/artifact-signed.yaml)  
**Rego Source:** [artifact-signed.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/sarif/artifact-signed.rego)  
**Labels:** SARIF  

Verify the artifact referenced in the SARIF report is signed to confirm its integrity.

:::note 
This rule requires Signed [SARIF Evidence](https://scribe-security.netlify.app/docs/valint/sarif).  
::: 
:::tip 
> Evidence **IS** required for this rule and will fail if missing.  
::: 
:::tip 
> Evidence **IS** required for this rule and will fail if missing.  
::: 
:::tip 
Signed Evidence for this rule **IS** required by default.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 

## Mitigation  
Ensures that the referenced artifact has a valid digital signature, confirming its integrity and authenticity. This prevents tampering and verifies that the artifact originates from a trusted source.



## Description  
This rule verifies that the artifact referenced in the SARIF report has been cryptographically signed.
It uses the provided evidence (which must adhere to the SARIF 2.1.0 schema) to confirm that a valid signature exists.
The rule checks that the evidence indicates the artifact is signed, ensuring that it has not been modified since its creation.
Additionally, the rule validates that the signature corresponds to one of the expected identities as defined in the configuration.

### **Evidence Requirements**
- Evidence must be provided in a generic format conforming to SARIF 2.1.0.
- The SARIF report must indicate that the artifact is signed (i.e., the 'signed' flag is true).
- The signer's identity should match one of the specified common names or emails in the configuration.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | True |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://docs.oasis-open.org/sarif/sarif/2.1.0 |

