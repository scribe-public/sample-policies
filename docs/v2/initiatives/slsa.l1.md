# Initiative: SLSA L1 Framework”

**ID**: `SLSA.L1`  
**Version**: `1.0.0`  
**Source YAML**: `slsa.l1.yaml`  

**Short Description**: Evaluate SLSA L1

**Help**: https://slsa.dev/

## Defaults

```yaml
evidence:
  signed: false
```

## Controls Overview

| Control ID | Control Name | Control Description | Mitigation |
|------------|--------------|---------------------|------------|
| prov_exists | Provenance exists |  | Ensure that provenance metadata is present for critical build artifacts to support supply chain integrity. |

---

# Detailed Controls

## Provenance exists (ID: `prov_exists`)
**Mitigation**: Ensure that provenance metadata is present for critical build artifacts to support supply chain integrity.

### Rules

| Rule ID | Rule Name | Rule Description |
|---------|-----------|------------------|
| prov_exists | [Provenance exists](../rules/slsa/l1-provenance-exists.md) | Verify that the Provenance document evidence exists. |
