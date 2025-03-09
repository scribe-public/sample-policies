# Rule: Verify Rule Compliance in SARIF

**ID**: `sarif-policy`  
**Source YAML**: `verify-sarif.yaml`  
**Rego File Path**: `verify-sarif.rego`  

**Labels**: SARIF

**Short Description**: Verify the SARIF report complies with defined generic rules for compliance and security.

## Evidence Requirements

```yaml
signed: false
content_body_type: generic
target_type: data
predicate_type: http://docs.oasis-open.org/sarif/sarif/2.1.0
```
## Rule Parameters (`with`)

```yaml
rule_level: []
precision: []
rule_ids: []
ignore: []
max_allowed: 0
```
