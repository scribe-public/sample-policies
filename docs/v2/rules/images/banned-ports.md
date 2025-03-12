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


:::tip 
Rule Result will be set as 'open' if evidence is missing.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
his rule requires evaluation with a target; without one, the rule will be **disabled**.  
::: 
:::info  
This rule scoped by target and product.  
:::  

## Evidence Requirements  
| Field | Value |
|-------|-------|
| content_body_type | cyclonedx-json |
| target_type | container |
| filter-by | ['target', 'product'] |

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| banned_ports | [{'port': '3000', 'protocol': 'tcp'}] |
