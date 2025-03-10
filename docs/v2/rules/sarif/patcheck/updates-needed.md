# Rule: SARIF Update Needed

**ID**: `sarif-update-needed`  
**Source**: [v2/rules/sarif/patcheck/updates-needed.yaml](scribe-public/sample-policies.git/v2/rules/sarif/patcheck/updates-needed.yaml)  
**Rego File Path**: `updates-needed.rego`  

**Labels**: SARIF

**Short Description**: Verify no security packages require updates.

## Evidence Requirements

```yaml
signed: false
content_body_type: generic
target_type: data
predicate_type: http://docs.oasis-open.org/sarif/sarif/2.1.0
```
