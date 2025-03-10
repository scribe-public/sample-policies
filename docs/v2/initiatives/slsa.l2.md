# Initiative: SLSA L2 Framework”

**ID:** `SLSA.L2`  
**Version:** `1.0.0`  
**Bundle-Version:** `v2`  
**Source:** [v2/initiatives/slsa.l2.yaml](https://github.com/scribe-public/sample-policies/v2/initiatives/slsa.l2.yaml)  
**Short Description:** Evaluate SLSA Level 2  
**Help:** https://slsa.dev/  
## **Full Description**

Evaluate SLSA L2 and ensure that provenance information is both recorded and authenticated. This helps protect against unauthorized modifications and ensures artifact integrity."

> ** Evidence for this initiative is not required by default but is recommended.**

## Controls Overview

| Control ID | Control Name | Control Description | Mitigation |
|------------|--------------|---------------------|------------|
| prov_authn | Provenance authenticated | Ensure that provenance metadata for build artifacts is authenticated, confirming that it originates from a trusted source. | Authentication of provenance data prevents attackers from forging or modifying build metadata, ensuring the integrity of the software supply chain. |

## Evidence Defaults

| Field | Value |
|-------|-------|
| signed | False |

---

# Detailed Controls

## [prov_authn] Provenance authenticated)
**Description**: Ensure that provenance metadata for build artifacts is authenticated, confirming that it originates from a trusted source.

**Mitigation**: Authentication of provenance data prevents attackers from forging or modifying build metadata, ensuring the integrity of the software supply chain.

### Rules

| Rule ID | Rule Name | Rule Description |
|---------|-----------|------------------|
| prov_exists | [Provenance exists](../rules/slsa/l1-provenance-exists.md) | Ensure that provenance metadata is present for each build artifact, enabling traceability and verification. |
| prov_authn | [Provenance authenticated](../rules/slsa/l2-provenance-authenticated.md) | Verify that provenance metadata is cryptographically authenticated, ensuring it has not been tampered with. |
