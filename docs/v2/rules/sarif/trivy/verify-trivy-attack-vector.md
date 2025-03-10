# Rule: Verify Attack Vector Threshold in Trivy SARIF

**ID**: `trivy-attack-vectors`  
**Source**: [v2/rules/sarif/trivy/verify-trivy-attack-vector.yaml](scribe-public/sample-policies.git/v2/rules/sarif/trivy/verify-trivy-attack-vector.yaml)  
**Rego File Path**: `../verify-attack-vector.rego`  

**Labels**: SARIF, Trivy

**Short Description**: Verify no attack vector in the Trivy SARIF report exceeds the specified threshold.

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
