# Rule: Verify Provenance Document Exists

**ID**: `SLSA.L1`  
**Uses**: `slsa/l1-provenance-exists@v2/rules  
**Source**: [v2/rules/slsa/l1-provenance-exists.yaml](https://github.com/scribe-public/sample-policies/v2/rules/slsa/l1-provenance-exists.yaml)  
**Rego Source**: [l1-provenance-exists.rego](https://github.com/scribe-public/sample-policies/v2/rules/slsa/l1-provenance-exists.rego)  
**Short Description**: Verify that the Provenance document evidence exists.  
**Mitigation**: Recording comprehensive provenance metadata allows organizations to verify the integrity of the build process and ensures that only authorized and untampered artifacts are deployed.  
**Help**: https://slsa.dev/spec/v1.0/requirements  
**Labels**: SLSA

## Evidence Requirements

```yaml
filter-by:
- product
- target
signed: false
content_body_type: slsa
```
