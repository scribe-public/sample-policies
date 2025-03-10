# Rule: Verify Artifact Signature in SARIF

**ID**: `sarif-artifact-signed`  
**Source**: [v2/rules/sarif/artifact-signed.yaml](scribe-public/sample-policies.git/v2/rules/sarif/artifact-signed.yaml)  
**Rego File Path**: `artifact-signed.rego`  

**Labels**: SARIF

**Short Description**: Verify the artifact referenced in the SARIF report is signed to confirm its integrity.

## Evidence Requirements

```yaml
signed: true
content_body_type: generic
target_type: data
predicate_type: http://docs.oasis-open.org/sarif/sarif/2.1.0
```
## Rule Parameters (`with`)

```yaml
identity:
  common-names: []
  emails: []
```
