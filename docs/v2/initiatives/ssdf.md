# Initiative: SSDF Client Initiative

**ID:** `SSDF`  
**Version:** `1.0.0`  
**Bundle-Version:** `v2`  
**Source:** [v2/initiatives/ssdf.yaml](https://github.com/scribe-public/sample-policies/v2/initiatives/ssdf.yaml)  
**Short Description:** Evaluate PS rules from the SSDF initiative  
**Help:** https://csrc.nist.gov/pubs/sp/800/218/final  
**Full Description:**  
This initiative enforces key controls from the Secure Software Development Framework (SSDF) to ensure  the integrity and security of your software supply chain. It evaluates critical process (PS) rules  to detect vulnerabilities, enforce proper access and commit practices, and secure code repositories.

> ** Evidence for this initiative is not required by default but is recommended.**

## Controls Overview

| Control ID | Control Name | Control Description | Mitigation |
|------------|--------------|---------------------|------------|
|  | SSDF-IMAGE | Ensures that container images are verifiable and that their build metadata is archived for supply chain integrity. | Mitigates the risk of deploying untrusted or compromised container images by enforcing rules  that verify image build integrity and preserve critical SBOM metadata.
 |
|  | SSDF-ORG | Verifies that organizational security policies, such as multi-factor authentication and admin limitations, are enforced. | Reduces risks of unauthorized access and changes by ensuring strong organizational security practices  and process signoffs.
 |
|  | SSDF-REPO | Ensures repository-level controls are in place, including branch protection, code archiving, and repository privacy. | Minimizes the risk of code tampering and unauthorized modifications by enforcing strict repository controls  and preserving code history.
 |

## Evidence Defaults

| Field | Value |
|-------|-------|
| signed | False |

---

# Detailed Controls

## SSDF-IMAGE (ID: ``)
**Description**: Ensures that container images are verifiable and that their build metadata is archived for supply chain integrity.

**Mitigation**: Mitigates the risk of deploying untrusted or compromised container images by enforcing rules  that verify image build integrity and preserve critical SBOM metadata.


### Rules

| Rule ID | Rule Name | Rule Description |
|---------|-----------|------------------|
| PS.2 | [Image-verifiable](../rules/ssdf/ps-2-image-verifiable.md) | PS.2 Provide a mechanism to verify the integrity of the image |
| PS.3.2 | [SBOM archived](../rules/ssdf/ps-3.2-archived-sbom.md) | PS.3.2 Archive SBOM |

## SSDF-ORG (ID: ``)
**Description**: Verifies that organizational security policies, such as multi-factor authentication and admin limitations, are enforced.

**Mitigation**: Reduces risks of unauthorized access and changes by ensuring strong organizational security practices  and process signoffs.


### Rules

| Rule ID | Rule Name | Rule Description |
|---------|-----------|------------------|
| PS.1.1 | [Enforce 2FA](../rules/ssdf/ps-1-2fa.md) | PS.1 Require 2FA for accessing code |
| PS.1.3 | [Limit admins](../rules/ssdf/ps-1-limit-admins.md) | PS.1 Restrict the maximum number of organization admins |
| PS.1.5 | [Require signoff on web commits](../rules/ssdf/ps-1-web-commit-signoff.md) | PS.1 Require contributors to sign when committing to Github through the web interface |

## SSDF-REPO (ID: ``)
**Description**: Ensures repository-level controls are in place, including branch protection, code archiving, and repository privacy.

**Mitigation**: Minimizes the risk of code tampering and unauthorized modifications by enforcing strict repository controls  and preserving code history.


### Rules

| Rule ID | Rule Name | Rule Description |
|---------|-----------|------------------|
| PS.3.1 | [Code archived](../rules/ssdf/ps-3.1-code-archived.md) | PS.3.1 Verify that the software release data is archived.
We assume running in Github thus the code is allways stored in a repository
 |
| PS.1.2 | [Branch protected](../rules/ssdf/ps-1-branch-protection.md) | PS.1 Require branch protection for the repository |
| PS.1.4 | [Repo private](../rules/ssdf/ps-1-repo-private.md) | PS.1 Assure the repository is private |
