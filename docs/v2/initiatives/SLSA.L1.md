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

| Control ID | Control Name | Control Description |
|------------|--------------|---------------------|
| prov_exists | Provenance exists |  |

## Detailed Controls

### Control: Provenance exists (ID: `prov_exists`)
#### Rules

| Rule ID | Rule Name | Rule Description |
|---------|----------|------------------|
| prov_exists | [Provenance exists](../rules/slsa/l1-provenance-exists.md) | Verify that the Provenance document evidence exists. |
