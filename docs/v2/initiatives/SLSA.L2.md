# Initiative: SLSA L2 Framework”

**ID**: `SLSA.L2`  
**Version**: `1.0.0`  
**Source YAML**: `slsa.l2.yaml`  

**Short Description**: Evaluate SLSA L2

**Full Description**:

...

**Help**: https://slsa.dev/

## Defaults

```yaml
evidence:
  signed: false
```

## Controls Overview

| Control ID | Control Name | Control Description |
|------------|--------------|---------------------|
| prov_authn | Provenance authenticated | Evaluate SLSA L2 |

## Detailed Controls

### Control: Provenance authenticated (ID: `prov_authn`)
**Description**: Evaluate SLSA L2

#### Rules

| Rule ID | Rule Name | Rule Description |
|---------|----------|------------------|
| prov_exists | [Provenance exists](../rules/slsa/l1-provenance-exists.md) | Evaluate SLSA L2 |
| prov_authn | [Provenance authenticated](../rules/slsa/l2-provenance-authenticated.md) | Verify the artifact is signed. |
