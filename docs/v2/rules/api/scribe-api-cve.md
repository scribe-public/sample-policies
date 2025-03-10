# Verify No Critical or High Vulnerabilities  
**Type:** Rule  
**ID:** `scribe-cve`  
**Uses:** `api/scribe-api-cve@v2/rules`  
**Source:** [v2/rules/api/scribe-api-cve.yaml](https://github.com/scribe-public/sample-policies/v2/rules/api/scribe-api-cve.yaml)  
**Rego Source:** [scribe-api.rego](https://github.com/scribe-public/sample-policies/v2/rules/api/scribe-api.rego)  
**Labels:** SCA, Blueprint, Scribe  

Verify via Scribe API that there no critical or high severity vulnerabilities in the target artifact (container image, folder, etc.).

> Rule Result will be set as 'open' if evidence is missing.  
> Rule requires the Scribe API to be enabled.  
> Signed Evidence for this rule **IS NOT** required by default but is recommended.  
> This rule scoped by product and target.  

## Evidence Requirements  
| Field | Value |
|-------|-------|
| filter-by | ['product', 'target'] |
| signed | False |
| content_body_type | cyclonedx-json |
| target_type | container |

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| superset | {'cve': {'max': 0, 'severity': 6}} |
