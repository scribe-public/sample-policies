# NTIA SBOM Compliance Check  
**Type:** Rule  
**ID:** `NTIA-compliance`  
**Uses:** `sbom/NTIA-compliance@v2/rules`  
**Source:** [v2/rules/sbom/NTIA-compliance.yaml](https://github.com/scribe-public/sample-policies/v2/rules/sbom/NTIA-compliance.yaml)  
**Rego Source:** [NTIA-compliance.rego](https://github.com/scribe-public/sample-policies/v2/rules/sbom/NTIA-compliance.rego)  
**Labels:** SBOM, Compliance  

Validates that SBOM metadata meets basic NTIA requirements for authors and supplier.
Checks that:
  1) Authors exist, are non-empty, and each author has both a name and email.
  2) Supplier exists with non-empty name, url, and contact. At least one contact has non-empty email.
  3) Optionally enforces a required author (case-insensitive match for name/email).
  4) Optionally enforces a required supplier (case-insensitive match for supplier name).


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
This rule scoped by product and target.  
:::  

## Evidence Requirements  
| Field | Value |
|-------|-------|
| filter-by | ['product', 'target'] |
| signed | False |
| content_body_type | cyclonedx-json |

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| required_author | {} |
| required_supplier | {} |
