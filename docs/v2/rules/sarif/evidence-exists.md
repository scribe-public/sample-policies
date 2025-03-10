# Rule: Verify Required Evidence in SARIF

**ID**: `required-sarif-evidence`
**Source**: [v2/rules/sarif/evidence-exists.yaml](https://github.com/scribe-public/sample-policies/v2/rules/sarif/evidence-exists.yaml)
**Uses**: `sarif/evidence-exists@v2/rules
**Rego Source**: [evidence-exists.rego](https://github.com/scribe-public/sample-policies/v2/rules/sarif/evidence-exists.rego)

**Labels**: SARIF

**Short Description**: Verify all required evidence exists as defined by the SARIF policy.

## Evidence Requirements

```yaml
signed: false
content_body_type: generic
target_type: data
predicate_type: http://docs.oasis-open.org/sarif/sarif/2.1.0
```
