# Disallow dependencies in SLSA Provenance Document  
**Type:** Rule  
**ID:** `slsa-builder-unallowed-dependencies`  
**Uses:** `slsa/banned-builder-deps@v2/rules`  
**Source:** [v2/rules/slsa/banned-builder-deps.yaml](https://github.com/scribe-public/sample-policies/v2/rules/slsa/banned-builder-deps.yaml)  
**Rego Source:** [banned-builder-deps.rego](https://github.com/scribe-public/sample-policies/v2/rules/slsa/banned-builder-deps.rego)  
**Labels:** SLSA, Image  

Verify that dependencies in the block list do not appear in the SLSA Proveance document.

> Evidence for this rule **IS NOT** required by default but is recommended.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | slsa |
| target_type | container |

## Rule Parameters (`with`)  
```yaml
blocklist: []
```

