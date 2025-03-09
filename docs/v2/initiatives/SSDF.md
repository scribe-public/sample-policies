# Initiative: SSDF Client Initiative

**ID**: `SSDF`  
**Version**: `1.0.0`  
**Source YAML**: `ssdf.yaml`  

**Short Description**: Evaluate PS rules from the SSDF initiative

**Help**: https://csrc.nist.gov/pubs/sp/800/218/final

## Defaults

```yaml
evidence:
  signed: false
```

## Controls Overview

| Control ID | Control Name | Control Description |
|------------|--------------|---------------------|
|  | SSDF-IMAGE |  |
|  | SSDF-ORG |  |
|  | SSDF-REPO |  |

## Detailed Controls

### Control: SSDF-IMAGE (ID: ``)
#### Rules

| Rule ID | Rule Name | Rule Description |
|---------|----------|------------------|
| PS.2 | [Image-verifiable](../rules/ssdf/ps-2-image-verifiable.md) | PS.2 Provide a mechanism to verify the integrity of the image |
| PS.3.2 | [SBOM archived](../rules/ssdf/ps-3.2-archived-sbom.md) | PS.3.2 Archive SBOM |

### Control: SSDF-ORG (ID: ``)
#### Rules

| Rule ID | Rule Name | Rule Description |
|---------|----------|------------------|
| PS.1.1 | [Enforce 2FA](../rules/ssdf/ps-1-2fa.md) | PS.1 Require 2FA for accessing code |
| PS.1.3 | [Limit admins](../rules/ssdf/ps-1-limit-admins.md) | PS.1 Restrict the maximum number of organization admins |
| PS.1.5 | [Require signoff on web commits](../rules/ssdf/ps-1-web-commit-signoff.md) | PS.1 Require contributors to sign when committing to Github through the web interface |

### Control: SSDF-REPO (ID: ``)
#### Rules

| Rule ID | Rule Name | Rule Description |
|---------|----------|------------------|
| PS.3.1 | [Code archived](../rules/ssdf/ps-3.1-code-archived.md) | PS.3.1 Verify that the software release data is archived.
We assume running in Github thus the code is allways stored in a repository
 |
| PS.1.2 | [Branch protected](../rules/ssdf/ps-1-branch-protection.md) | PS.1 Require branch protection for the repository |
| PS.1.4 | [Repo private](../rules/ssdf/ps-1-repo-private.md) | PS.1 Assure the repository is private |
