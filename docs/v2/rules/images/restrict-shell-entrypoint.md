# Rule: Disallow Container Shell Entrypoint  
**ID:** `images-disallow-shell-access`  
**Uses:** `images/restrict-shell-entrypoint@v2/rules`  
**Source:** [v2/rules/images/restrict-shell-entrypoint.yaml](https://github.com/scribe-public/sample-policies/v2/rules/images/restrict-shell-entrypoint.yaml)  
**Rego Source:** [restrict-shell-entrypoint.rego](https://github.com/scribe-public/sample-policies/v2/rules/images/restrict-shell-entrypoint.rego)  
**Short Description:** Verify the container image disallows shell entrypoint.  
**Labels:** SBOM, Images  

## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | cyclonedx-json |
| target_type | container |

