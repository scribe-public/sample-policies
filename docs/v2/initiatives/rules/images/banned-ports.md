---
sidebar_label: Banned Ports
title: Banned Ports
---  
# Banned Ports  
**Type:** Rule  
**ID:** `images-banned-ports`  
**Uses:** `images/banned-ports@v2/rules`  
**Source:** [v2/rules/images/banned-ports.yaml](https://github.com/scribe-public/sample-policies/v2/rules/images/banned-ports.yaml)  
**Rego Source:** [banned-ports.rego](https://github.com/scribe-public/sample-policies/v2/rules/images/banned-ports.rego)  
**Labels:** SBOM, Images  

Ensures that the container image does not expose ports that are disallowed by organizational policy.
The rule examines properties in the SBOM metadata and checks each value (expected in the format "port/protocol") against a provided banned ports list.
It fails if any banned port is exposed or if no banned ports list is provided.



## Mitigation  
Prevents deployment of container images that expose disallowed ports, reducing the risk of unauthorized network access  and potential exploitation. This check ensures that only images with approved port configurations are deployed.


:::tip 
Rule Result will be set as 'open' if evidence is missing.  
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

## Description  
This rule evaluates the CycloneDX SBOM evidence for a container image to verify that no disallowed ports are exposed.
It performs the following steps:

1. Retrieves all properties from the SBOM's `metadata.component.properties` whose names start with "imageExposedPorts_".
2. Expects each property value to be formatted as "port/protocol" (e.g., "3000/tcp") and splits the value into its components.
3. Compares each exposed port against the list of banned ports provided in the configuration (`with.banned_ports`).
   - If a banned port (and, if specified, protocol) is detected, the rule flags it as a violation.
4. If no banned ports list is provided, the rule also fails.

**Evidence Requirements:**

- Evidence must be provided in the CycloneDX JSON format.
- The SBOM must include a `metadata.component.properties` array with entries for exposed ports.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| content_body_type | cyclonedx-json |
| target_type | container |
| filter-by | ['target', 'product'] |

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| banned_ports | [] |
