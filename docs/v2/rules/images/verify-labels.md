# Verify Image Labels  
** Type:** Rule  
**ID:** `image-labels`  
**Uses:** `images/verify-labels@v2/rules`  
**Source:** [v2/rules/images/verify-labels.yaml](https://github.com/scribe-public/sample-policies/v2/rules/images/verify-labels.yaml)  
**Rego Source:** [verify-labels.rego](https://github.com/scribe-public/sample-policies/v2/rules/images/verify-labels.rego)  
**Labels:** SBOM, Images  

Verify specified labels key-value pairs exist in the image.

> Evidence for this rule **IS NOT** required by default but is recommended.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | cyclonedx-json |
| target_type | container |

## Rule Parameters (`with`)  
```yaml
labels: []
```

