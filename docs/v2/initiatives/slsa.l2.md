---
sidebar_label: SLSA L2 Framework
title: SLSA L2 Framework
---  
# SLSA L2 Framework  
**Type:** Initiative  
**ID:** `SLSA.L2`  
**Version:** `1.0.0`  
**Bundle-Version:** `v2`  
**Source:** [v2/initiatives/slsa.l2.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/initiatives/slsa.l2.yaml)  
**Help:** https://slsa.dev/  

Evaluate SLSA Level 2

## **Description**

Evaluate SLSA L2 and ensure that provenance information is both recorded and authenticated. This helps protect against unauthorized modifications and ensures artifact integrity."


## Controls Overview

| Control Name | Control Description | Mitigation |
|------------|--------------|---------------------|------------|
| [[prov_authn] Provenance authenticated](#provenance-authenticated) | Ensure that provenance metadata for build artifacts is authenticated, confirming that it originates from a trusted source. | Authentication of provenance data prevents attackers from forging or modifying build metadata, ensuring the integrity of the software supply chain. |

## Evidence Defaults

| Field | Value |
|-------|-------|
| signed | False |

---

# Detailed Controls

## [prov_authn] Provenance authenticated

Ensure that provenance metadata for build artifacts is authenticated, confirming that it originates from a trusted source.


### Mitigation  
Authentication of provenance data prevents attackers from forging or modifying build metadata, ensuring the integrity of the software supply chain.

### Rules

| Rule ID | Rule Name | Rule Description |
|---------|-----------|------------------|
| [prov_exists](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/slsa/l1-provenance-exists) | [Provenance exists](rules/slsa/l1-provenance-exists.md) | Ensure that provenance metadata is present for each build artifact, enabling traceability and verification. |
| [prov_authn](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/slsa/l2-provenance-authenticate) | [Provenance authenticated](rules/slsa/l2-provenance-authenticated.md) | Verify that provenance metadata is cryptographically authenticated, ensuring it has not been tampered with. |
