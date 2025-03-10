# Rule: Verify Rule Compliance in SARIF

**ID**: `sarif-policy`
**Source**: [v2/rules/sarif/verify-sarif.yaml](https://github.com/scribe-public/sample-policies/v2/rules/sarif/verify-sarif.yaml)
**Uses**: `sarif/verify-sarif@v2/rules
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
