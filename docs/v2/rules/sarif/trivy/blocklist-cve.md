# Rule: Trivy Blocklist CVE Check

**ID**: `trivy-blocklist-cve`  
**Source YAML**: `blocklist-cve.yaml`  
**Rego File Path**: `../blocklist-report.rego`  

**Labels**: SARIF, Trivy

**Short Description**: Verify a CVE Blocklist against a SARIF report

## Evidence Requirements

```yaml
signed: false
content_body_type: generic
target_type: data
predicate_type: http://docs.oasis-open.org/sarif/sarif/2.1.0
tool: Trivy Vulnerability Scanner
filter-by:
- product
```
## Rule Parameters (`with`)

```yaml
rule_ids: []
violations_threshold: 0
```
