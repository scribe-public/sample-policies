# Rule: Verify Tool Evidence in SARIF

**ID**: `sarif-tool-evidence`
**Source**: [v2/rules/sarif/verify-tool-evidence.yaml](https://github.com/scribe-public/sample-policies/v2/rules/sarif/verify-tool-evidence.yaml)
**Uses**: `sarif/verify-tool-evidence@v2/rules
**Rego File Path**: `verify-tool-evidence.rego`

**Labels**: SARIF

**Short Description**: Verify required tools were used to generate the SARIF report.

## Evidence Requirements

```yaml
signed: false
content_body_type: generic
target_type: data
tool: semgrep
predicate_type: http://docs.oasis-open.org/sarif/sarif/2.1.0
```
