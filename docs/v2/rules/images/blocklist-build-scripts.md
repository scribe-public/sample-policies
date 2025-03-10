# Restrict Build Scripts  
**Type:** Rule  
**ID:** `images-disallowed-build-script`  
**Uses:** `images/blocklist-build-scripts@v2/rules`  
**Source:** [v2/rules/images/blocklist-build-scripts.yaml](https://github.com/scribe-public/sample-policies/v2/rules/images/blocklist-build-scripts.yaml)  
**Rego Source:** [blocklist-build-scripts.rego](https://github.com/scribe-public/sample-policies/v2/rules/images/blocklist-build-scripts.rego)  
**Labels:** SBOM, Images  

Verify no build scripts commands appear in block list.

> Evidence for this rule **IS NOT** required by default but is recommended.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | cyclonedx-json |
| target_type | container |

## Rule Parameters (`with`)  
```yaml
blocklist: []
```

