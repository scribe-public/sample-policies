# Rule: Verify that provenance is authenticated

**ID**: `SLSA.L2`
**Source**: [v2/rules/slsa/l2-provenance-authenticated.yaml](https://github.com/scribe-public/sample-policies/v2/rules/slsa/l2-provenance-authenticated.yaml)
**Uses**: `slsa/l2-provenance-authenticated@v2/rules
**Rego File Path**: `l2-provenance-authenticated.rego`

**Labels**: SLSA

**Short Description**: Verify the artifact is signed.

**Mitigation**:

Cryptographic authentication prevents tampering with provenance data, ensuring that only valid and secure build information is used to establish the integrity of the software supply chain.


**Help**: https://slsa.dev/spec/v1.0/requirements

## Evidence Requirements

```yaml
filter-by:
- product
- target
signed: true
content_body_type: slsa
```
## Rule Parameters (`with`)

```yaml
identity:
  common-names: []
  emails: []
```
