# Require SBOM Signature  
** Type:** Rule  
**ID:** `sbom-signed`  
**Uses:** `sbom/artifact-signed@v2/rules`  
**Source:** [v2/rules/sbom/artifact-signed.yaml](https://github.com/scribe-public/sample-policies/v2/rules/sbom/artifact-signed.yaml)  
**Rego Source:** [artifact-signed.rego](https://github.com/scribe-public/sample-policies/v2/rules/sbom/artifact-signed.rego)  
**Labels:** SBOM, Blueprint  

Verify the SBOM is signed.

> Evidence for this rule **IS* required by default.**


## Evidence Requirements  
| Field | Value |
|-------|-------|
| filter-by | ['product', 'target'] |
| content_body_type | cyclonedx-json |
| signed | True |

## Rule Parameters (`with`)  
```yaml
identity:
  common-names: []
  emails: []
```

