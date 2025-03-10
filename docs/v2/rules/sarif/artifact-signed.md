# Rule: Verify Artifact Signature in SARIF  
**ID:** `sarif-artifact-signed`  
**Uses:** `sarif/artifact-signed@v2/rules`  
**Source:** [v2/rules/sarif/artifact-signed.yaml](https://github.com/scribe-public/sample-policies/v2/rules/sarif/artifact-signed.yaml)  
**Rego Source:** [artifact-signed.rego](https://github.com/scribe-public/sample-policies/v2/rules/sarif/artifact-signed.rego)  
**Short Description:** Verify the artifact referenced in the SARIF report is signed to confirm its integrity.  
**Labels:** SARIF  

## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | True |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://docs.oasis-open.org/sarif/sarif/2.1.0 |

## Rule Parameters (`with`)  
```yaml
identity:
  common-names: []
  emails: []
```

