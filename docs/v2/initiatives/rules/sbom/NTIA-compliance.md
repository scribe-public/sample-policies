---
sidebar_label: NTIA SBOM Compliance Check
title: NTIA SBOM Compliance Check
---  
# NTIA SBOM Compliance Check  
**Type:** Rule  
**ID:** `NTIA-compliance`  
**Uses:** `sbom/NTIA-compliance@v2/rules`  
**Source:** [v2/rules/sbom/NTIA-compliance.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/sbom/NTIA-compliance.yaml)  
**Rego Source:** [NTIA-compliance.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/sbom/NTIA-compliance.rego)  
**Labels:** SBOM, Compliance, Image, Source  

Validates that SBOM metadata meets basic NTIA requirements for authors and supplier.


:::note 
This rule requires [SBOM](https://scribe-security.netlify.app/docs/valint/sbom).  
  
Ensure that the SBOM includes metadata for authors and suppliers to meet NTIA requirements.

For example,  
```yaml
valint bom my_company/my_image:latest \
  --author-name "bob" \
  --author-email bob@my_company.com \
  --author-phone "123-456-7890" \
  --supplier-email bob@my_company.com  \
  --author-email "bob@my_company.com" --supplier-name "alice" \
  --supplier-url "https://my_company.com" --supplier-phone "123-456-7890" 
```

**Input Example:**

```yaml
- uses: sbom/NTIA-compliance@v2/rules
  with:
    required_author: 
      name: "bom"
      email: "bob@company.com"
    required_supplier: 
      name: "alice"
```

::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 
:::info  
Rule is scoped by product and target.  
:::  

## Mitigation  
Ensures that the SBOM metadata meets NTIA requirements, reducing the risk of incomplete or inaccurate information about authors and suppliers.



## Description  
This rule validates that the SBOM metadata meets basic NTIA requirements for authors and suppliers.
It performs the following steps:

1. Checks that authors exist, are non-empty, and each author has both a name and email.
2. Checks that the supplier exists with a non-empty name, URL, and contact. At least one contact must have a non-empty email.
3. Optionally enforces a required author (case-insensitive match for name/email).
4. Optionally enforces a required supplier (case-insensitive match for supplier name).

**Evidence Requirements:**
- Evidence must be provided in the CycloneDX JSON format.
- The SBOM must include metadata for authors and suppliers.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| filter-by | ['product', 'target'] |
| signed | False |
| content_body_type | cyclonedx-json |

## Input Definitions  
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| required_author | object | False | The required author (case-insensitive match for name/email). |
| required_supplier | object | False | The required supplier (case-insensitive match for supplier name). |

