# Initiative: SP-800-53 Supply Chain Integrity Initiative

**ID**: `SP-800-53-SC-REQUIREMENTS`  
**Version**: `1.0.0`  
**Source YAML**: `sp-800-53.yaml`  

**Short Description**: This initiative enforces key supply chain requirements from NIST SP 800-53. It mandates that container builds include:
  - A Software Bill of Materials (SBOM) to ensure component inventory and traceability,
    addressing requirements from SR-4 and CM-8.
  - Provenance data to support architectural traceability, as outlined in SA-8.
Both the SBOM and the provenance artifacts must be cryptographically signed to meet integrity requirements specified in SA-12.


**Help**: https://csrc.nist.gov/publications/detail/sp/800-53/rev-4/final

## Defaults

```yaml
evidence:
  signed: false
```

## Controls Overview

| Control ID | Control Name | Control Description |
|------------|--------------|---------------------|
|  | SBOM Requirement (SR-4 / CM-8) | Enforce that every container build includes a Software Bill of Materials (SBOM), ensuring that all components are inventoried and traceable. This requirement addresses both SR-4 and the component inventory aspects of CM-8.
 |
|  | Provenance Requirement (SA-8) | Enforce that every container build includes provenance data, supporting traceability within the security architecture as required by SA-8.
 |
|  | SBOM Signature Enforcement (SA-12) | Enforce that the SBOM is cryptographically signed to verify its integrity and authenticity, aligning with SA-12 requirements.
 |
|  | Provenance Signature Enforcement (SA-12) | Enforce that the provenance data is cryptographically signed to guarantee the integrity of the build process, as required by SA-12.
 |

## Detailed Controls

### Control: SBOM Requirement (SR-4 / CM-8) (ID: ``)
**Description**: Enforce that every container build includes a Software Bill of Materials (SBOM), ensuring that all components are inventoried and traceable. This requirement addresses both SR-4 and the component inventory aspects of CM-8.


#### Rules

| Rule ID | Rule Name | Rule Description |
|---------|----------|------------------|
| require-sbom | [Require SBOM](../rules/sbom/require-sbom.md) | Ensure an SBOM is provided for all container builds. |
| image-labels | [Verify Supply Chain Labels](../rules/images/verify-labels.md) | Confirm that container images include required `opencontainers` labels:
 |
| NTIA-compliance | [NTIA SBOM Compliance Check](../rules/sbom/NTIA-compliance.md) | Verifies that the SBOM includes valid authors and supplier data following NTIA guidelines. Optionally enforces a required_author and required_supplier if provided.
 |

### Control: Provenance Requirement (SA-8) (ID: ``)
**Description**: Enforce that every container build includes provenance data, supporting traceability within the security architecture as required by SA-8.


#### Rules

| Rule ID | Rule Name | Rule Description |
|---------|----------|------------------|
| SLSA.L1 | [Require Provenance](../rules/slsa/l1-provenance-exists.md) | Ensure provenance data is present for container builds. |

### Control: SBOM Signature Enforcement (SA-12) (ID: ``)
**Description**: Enforce that the SBOM is cryptographically signed to verify its integrity and authenticity, aligning with SA-12 requirements.


#### Rules

| Rule ID | Rule Name | Rule Description |
|---------|----------|------------------|
| require-sbom | [Signed SBOM Requirement](../rules/sbom/require-sbom.md) | Validate that the SBOM is cryptographically signed. |

### Control: Provenance Signature Enforcement (SA-12) (ID: ``)
**Description**: Enforce that the provenance data is cryptographically signed to guarantee the integrity of the build process, as required by SA-12.


#### Rules

| Rule ID | Rule Name | Rule Description |
|---------|----------|------------------|
| SLSA.L2 | [Signed Provenance Requirement](../rules/slsa/l2-provenance-authenticated.md) | Validate that the provenance data is cryptographically signed. |
