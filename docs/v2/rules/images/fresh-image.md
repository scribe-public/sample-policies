# Rule: Fresh Image  
**ID:** `fresh-image`  
**Uses:** `images/fresh-image@v2/rules`  
**Source:** [v2/rules/images/fresh-image.yaml](https://github.com/scribe-public/sample-policies/v2/rules/images/fresh-image.yaml)  
**Rego Source:** [fresh-image.rego](https://github.com/scribe-public/sample-policies/v2/rules/images/fresh-image.rego)  
**Labels:** SBOM, Images  

Verify the image is not older than the specified threshold.

> Evidence for this rule **IS NOT** required by default but is recommended.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | cyclonedx-json |
| target_type | container |

## Rule Parameters (`with`)  
```yaml
max_days: 183
```

