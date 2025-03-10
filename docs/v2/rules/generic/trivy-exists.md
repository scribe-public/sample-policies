# Required Trivy Evidence Exists  
**Type:** Rule  
**ID:** `required-trivy-evidence`  
**Uses:** `generic/trivy-exists@v2/rules`  
**Source:** [v2/rules/generic/trivy-exists.yaml](https://github.com/scribe-public/sample-policies/v2/rules/generic/trivy-exists.yaml)  
**Labels:** 3rd-party  

Verify required Trivy evidence exists

> Evidence for this rule **IS NOT** required by default but is recommended.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| content_body_type | generic |
| target_type | data |
| predicate_type | https://aquasecurity.github.io/trivy/v0.42/docs/configuration/reporting/#json |

