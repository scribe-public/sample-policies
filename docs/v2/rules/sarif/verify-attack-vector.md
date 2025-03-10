# Rule: Verify Attack Vector Exists in SARIF

**ID**: `sarif-attack-vectors`  
**Uses**: `sarif/verify-attack-vector@v2/rules  
**Source**: [v2/rules/sarif/verify-attack-vector.yaml](https://github.com/scribe-public/sample-policies/v2/rules/sarif/verify-attack-vector.yaml)  
**Rego Source**: [verify-attack-vector.rego](https://github.com/scribe-public/sample-policies/v2/rules/sarif/verify-attack-vector.rego)  
**Short Description**: Verify required evidence validates attack vectors in the SARIF report.  
**Labels**: SARIF

## Evidence Requirements

```yaml
signed: false
content_body_type: generic
target_type: data
predicate_type: http://docs.oasis-open.org/sarif/sarif/2.1.0
```
## Rule Parameters (`with`)

```yaml
attack_vectors: []
violations_threshold: 0
```
