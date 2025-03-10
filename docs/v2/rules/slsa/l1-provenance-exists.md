# Rule: Verify Provenance Document Exists

**ID**: `SLSA.L1`  
**Source**: [v2/rules/slsa/l1-provenance-exists.yaml](scribe-public/sample-policies.git/v2/rules/slsa/l1-provenance-exists.yaml)  
**Rego File Path**: `l1-provenance-exists.rego`  

**Labels**: SLSA

**Short Description**: Verify that the Provenance document evidence exists.

**Mitigation**:

Recording comprehensive provenance metadata allows organizations to verify the integrity of the build process and ensures that only authorized and untampered artifacts are deployed.

**Help**: https://slsa.dev/spec/v1.0/requirements

## Evidence Requirements

```yaml
filter-by:
- product
- target
signed: false
content_body_type: slsa
```
