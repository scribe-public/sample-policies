# Rule: Verify Tool Evidence in SARIF

**ID**: `sarif-tool-evidence`  
**Source YAML**: `verify-tool-evidence.yaml`  
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
