---
sidebar_label: SSDF Client Initiative
title: SSDF Client Initiative
---  
# SSDF Client Initiative  
**Type:** Initiative  
**ID:** `SSDF`  
**Version:** `1.0.0`  
**Bundle-Version:** `v2`  
**Source:** [v2/initiatives/ssdf.yaml](https://github.com/scribe-public/sample-policies/v2/initiatives/ssdf.yaml)  
**Help:** https://csrc.nist.gov/pubs/sp/800/218/final  

Evaluate PS rules from the SSDF initiative

:::tip  
Evidence for this initiative **IS NOT** required by default but is recommended.  
:::  
## **Description**

This initiative enforces key controls from the Secure Software Development Framework (SSDF) to ensure  the integrity and security of your software supply chain. It evaluates critical process (PS) rules  to detect vulnerabilities, enforce proper access and commit practices, and secure code repositories.


## Controls Overview

| Control ID | Control Name | Control Description | Mitigation |
|------------|--------------|---------------------|------------|
|  [](#ssdf-image) | SSDF-IMAGE | Ensures that container images are verifiable and that their build metadata is archived for supply chain integrity. | Mitigates the risk of deploying untrusted or compromised container images by enforcing rules  that verify image build integrity and preserve critical SBOM metadata.
 |
|  [](#ssdf-org) | SSDF-ORG | Verifies that organizational security policies, such as multi-factor authentication and admin limitations, are enforced. | Reduces risks of unauthorized access and changes by ensuring strong organizational security practices  and process signoffs.
 |
|  [](#ssdf-repo) | SSDF-REPO | Ensures repository-level controls are in place, including branch protection, code archiving, and repository privacy. | Minimizes the risk of code tampering and unauthorized modifications by enforcing strict repository controls  and preserving code history.
 |

## Evidence Defaults

| Field | Value |
|-------|-------|
| signed | False |

---

# Detailed Controls

## [] SSDF-IMAGE

Ensures that container images are verifiable and that their build metadata is archived for supply chain integrity.


### Mitigation  
Mitigates the risk of deploying untrusted or compromised container images by enforcing rules  that verify image build integrity and preserve critical SBOM metadata.


### Rules

| Rule ID | Rule Name | Rule Description |
|---------|-----------|------------------|
| [PS.2](https://scribe-security.netlify.app/docs/configuration/initiatives/rules/ssdf/ps-2-image-verifiable.md) | [Image-verifiable](rules/ssdf/ps-2-image-verifiable.md) | PS.2 Provide a mechanism to verify the integrity of the image |
| [PS.3.2](https://scribe-security.netlify.app/docs/configuration/initiatives/rules/ssdf/ps-3.2-archived-sbom.md) | [SBOM archived](rules/ssdf/ps-3.2-archived-sbom.md) | PS.3.2 Archive SBOM |

## [] SSDF-ORG

Verifies that organizational security policies, such as multi-factor authentication and admin limitations, are enforced.


### Mitigation  
Reduces risks of unauthorized access and changes by ensuring strong organizational security practices  and process signoffs.


### Rules

| Rule ID | Rule Name | Rule Description |
|---------|-----------|------------------|
| [PS.1.1](https://scribe-security.netlify.app/docs/configuration/initiatives/rules/ssdf/ps-1-2fa.md) | [Enforce 2FA](rules/ssdf/ps-1-2fa.md) | PS.1 Require 2FA for accessing code |
| [PS.1.3](https://scribe-security.netlify.app/docs/configuration/initiatives/rules/ssdf/ps-1-limit-admins.md) | [Limit admins](rules/ssdf/ps-1-limit-admins.md) | PS.1 Restrict the maximum number of organization admins |
| [PS.1.5](https://scribe-security.netlify.app/docs/configuration/initiatives/rules/ssdf/ps-1-web-commit-signoff.md) | [Require signoff on web commits](rules/ssdf/ps-1-web-commit-signoff.md) | PS.1 Require contributors to sign when committing to Github through the web interface |

## [] SSDF-REPO

Ensures repository-level controls are in place, including branch protection, code archiving, and repository privacy.


### Mitigation  
Minimizes the risk of code tampering and unauthorized modifications by enforcing strict repository controls  and preserving code history.


### Rules

| Rule ID | Rule Name | Rule Description |
|---------|-----------|------------------|
| [PS.3.1](https://scribe-security.netlify.app/docs/configuration/initiatives/rules/ssdf/ps-3.1-code-archived.md) | [Code archived](rules/ssdf/ps-3.1-code-archived.md) | PS.3.1 Verify that the software release data is archived.
We assume running in Github thus the code is allways stored in a repository
 |
| [PS.1.2](https://scribe-security.netlify.app/docs/configuration/initiatives/rules/ssdf/ps-1-branch-protection.md) | [Branch protected](rules/ssdf/ps-1-branch-protection.md) | PS.1 Require branch protection for the repository |
| [PS.1.4](https://scribe-security.netlify.app/docs/configuration/initiatives/rules/ssdf/ps-1-repo-private.md) | [Repo private](rules/ssdf/ps-1-repo-private.md) | PS.1 Assure the repository is private |
