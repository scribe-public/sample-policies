# Rule: Verify Image Labels  
**ID:** `image-labels`  
**Uses:** `images/verify-labels@v2/rules`  
**Source:** [v2/rules/images/verify-labels.yaml](https://github.com/scribe-public/sample-policies/v2/rules/images/verify-labels.yaml)  
**Rego Source:** [verify-labels.rego](https://github.com/scribe-public/sample-policies/v2/rules/images/verify-labels.rego)  
**Short Description:** Verify specified labels key-value pairs exist in the image.  
**Labels:** SBOM, Images  

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

