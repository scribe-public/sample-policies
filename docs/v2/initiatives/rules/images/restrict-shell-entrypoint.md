---
sidebar_label: Disallow Container Shell Entrypoint
title: Disallow Container Shell Entrypoint
---  
# Disallow Container Shell Entrypoint  
**Type:** Rule  
**ID:** `images-disallow-shell-access`  
**Source:** [v2/rules/images/restrict-shell-entrypoint.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/images/restrict-shell-entrypoint.yaml)  
**Rego Source:** [restrict-shell-entrypoint.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/images/restrict-shell-entrypoint.rego)  
**Labels:** SBOM, Images  

Verify the container image disallows shell entrypoint.

:::note 
This rule requires Image SBOM. See [here](https://deploy-preview-299--scribe-security.netlify.app/docs/valint/sbom) for more details.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 

## Usage example

```yaml
uses: images/restrict-shell-entrypoint@v2

## Usage example

```yaml
with: images/restrict-shell-entrypoint@v2
```

## Mitigation  
Prevent unauthorized shell access by ensuring container images do not use a shell-based entrypoint. This reduces the risk of privilege escalation, unauthorized command execution, and potential security vulnerabilities from unrestricted shell access within containers.



## Description  
This rule ensures that container images do not allow shell access by verifying their configured entrypoint.  
Attackers often exploit shell access in containerized environments to execute arbitrary commands, escalate privileges, or perform unauthorized actions.  
This rule extracts the 'entrypoint' property from the CycloneDX SBOM metadata and checks whether it contains a shell invocation (e.g., 'sh', 'bash').  

### **Evidence Requirements**
- Evidence must be provided in the `cyclonedx-json` format.  
- The SBOM must contain a component under `metadata.component.properties` with a property named "entrypoint".  


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | cyclonedx-json |
| target_type | container |

