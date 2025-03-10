# Rule: Require Image Labels  
**ID:** `required-image-labels`  
**Uses:** `images/verify-labels-exist@v2/rules`  
**Source:** [v2/rules/images/verify-labels-exist.yaml](https://github.com/scribe-public/sample-policies/v2/rules/images/verify-labels-exist.yaml)  
**Rego Source:** [verify-labels-exist.rego](https://github.com/scribe-public/sample-policies/v2/rules/images/verify-labels-exist.rego)  
**Short Description:** Verify the image has the specified labels.  
**Labels:** SBOM, Images  
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

