# Rule: Verify Semgrep Rule in SARIF

**ID**: `sarif-semgrep-report`
**Source**: [v2/rules/sarif/verify-semgrep-report.yaml](https://github.com/scribe-public/sample-policies/v2/rules/sarif/verify-semgrep-report.yaml)
**Uses**: `sarif/verify-semgrep-report@v2/rules
**Rego File Path**: `verify-semgrep-report.rego`

**Labels**: SARIF, Semgrep

**Short Description**: Verify the Semgrep SARIF report complies with predefined rules to ensure compliance and detect issues.

## Evidence Requirements

```yaml
signed: false
content_body_type: generic
target_type: data
predicate_type: http://docs.oasis-open.org/sarif/sarif/2.1.0
```
## Rule Parameters (`with`)

```yaml
rule_ids: []
violations_threshold: 0
```
