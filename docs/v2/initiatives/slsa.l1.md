---
sidebar_label: SLSA L1 Framework
title: SLSA L1 Framework
---  
# SLSA L1 Framework  
**Type:** Initiative  
**ID:** `SLSA.L1`  
**Version:** `1.0.0`  
**Bundle-Version:** `v2`  
**Source:** [v2/initiatives/slsa.l1.yaml](https://github.com/scribe-public/sample-policies/v2/initiatives/slsa.l1.yaml)  

Evaluate SLSA Level 1

**Help:** https://slsa.dev/  
:::tip  
Evidence for this initiative **IS NOT** required by default but is recommended.  
:::  
## **Description**

This initiative ensures that every critical build artifact includes the minimum required provenance metadata as specified in SLSA Level 1. By recording detailed information about the build process—such as timestamps, authors, and build details— organizations establish a traceable chain-of-custody for their software artifacts.


## Controls Overview

| Control ID | Control Name | Control Description | Mitigation |
|------------|--------------|---------------------|------------|
|  [prov_exists](#prov_exists-provenance-exists) | Provenance exists | This control verifies that essential provenance metadata is present for each build artifact. | Ensure that provenance metadata is present for critical build artifacts to support supply chain integrity. |

## Evidence Defaults

| Field | Value |
|-------|-------|
| signed | False |

---

# Detailed Controls

## [prov_exists] Provenance exists

This control verifies that essential provenance metadata is present for each build artifact.


### Mitigation  
Ensure that provenance metadata is present for critical build artifacts to support supply chain integrity.

### Rules

| Rule ID | Rule Name | Rule Description |
|---------|-----------|------------------|
| [prov_exists](https://scribe-security.netlify.app/docs/guides/policy-reference/rules/slsa/l1-provenance-exists.md) | [Provenance exists](rules/slsa/l1-provenance-exists.md) | Verify that the Provenance document evidence exists. |
