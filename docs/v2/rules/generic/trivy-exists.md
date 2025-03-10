# Rule: Required Trivy Evidence Exists  
**ID:** `required-trivy-evidence`  
**Uses:** `generic/trivy-exists@v2/rules`  
**Source:** [v2/rules/generic/trivy-exists.yaml](https://github.com/scribe-public/sample-policies/v2/rules/generic/trivy-exists.yaml)  
**Short Description:** Verify required Trivy evidence exists  
**Labels:** 3rd-party  

## Evidence Requirements  
| Field | Value |
|-------|-------|
| content_body_type | generic |
| target_type | data |
| predicate_type | https://aquasecurity.github.io/trivy/v0.42/docs/configuration/reporting/#json |

