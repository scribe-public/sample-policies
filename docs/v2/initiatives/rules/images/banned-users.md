---
sidebar_label: Disallow Specific Users in SBOM
title: Disallow Specific Users in SBOM
---  
# Disallow Specific Users in SBOM  
**Type:** Rule  
**ID:** `sbom-disallowed-users`  
**Uses:** `images/banned-users@v2/rules`  
**Source:** [v2/rules/images/banned-users.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/images/banned-users.yaml)  
**Rego Source:** [banned-users.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/images/banned-users.rego)  
**Labels:** SBOM, Image  

Verify specific users are not allowed in an SBOM.

:::note 
This rule requires Image SBOM. See [here](https://scribe-security.netlify.app/docs/valint/sbom) for more details.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 
:::info  
Rule is scoped by target and product.  
:::  

## Mitigation  
Prevents the execution of container images with default or disallowed user accounts reducing the risk of privilege escalation and ensuring that only secure, non-privileged user configurations are used.



## Description  
This rule inspects the CycloneDX SBOM evidence for a container image to ensure that the image is not configured 
to run with a banned default user. It does so by examining the `metadata.component.properties` array for a property 
with the name "user". The value of this property is then compared against a list of disallowed users specified in 
the configuration (via `with.users`). If the image is found to be running as a banned user (for example, "root"), 
a violation is recorded.

**Evidence Requirements:**

- Evidence must be provided in the CycloneDX JSON format.
- The SBOM must include a `metadata.component.properties` array with an entry where the property name is "user".
- The disallowed user list (e.g., ["root"]) must be provided in the `with.users` parameter.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | cyclonedx-json |
| target_type | container |
| filter-by | ['target', 'product'] |

## Input Definitions  
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| users | array | False | A list of disallowed users. Each entry should be a string representing a username. |

