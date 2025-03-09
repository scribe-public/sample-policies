# Initiative: Venafi Blueprint

**ID**: `blueprint-securesoftwarepipeline`  
**Version**: ``  
**Source YAML**: `bp1.yaml`  

**Short Description**: 

**Help**: https://github.com/Venafi/blueprint-securesoftwarepipeline

## Defaults

```yaml
evidence:
  signed: true
```

## Controls Overview

| Control ID | Control Name | Control Description |
|------------|--------------|---------------------|
| CT-1 | Restrict administrative access to CI/CD tools | Restrict administrative access to CI/CD tools |
| CT-2 | Only accept commits signed with a developer GPG key | Only accept commits signed with a developer GPG key |
| CT-3 | Automation access keys expire automatically | Automation access keys expire automatically |
| CT-4 | Reduce automation access to read-only | Reduce automation access to read-only |
| CT-6 | Any critical or high severity vulnerability breaks the build | Any critical or high severity vulnerability breaks the build |
| CT-8 | Validate artifact digest | Validate artifact digest |
| CT-9 | Pull-requests require two reviewers (including one default reviewer) and a passing build to be merged | Pull-requests require two reviewers (including one default reviewer) and a passing build to be merged |
| CT-11 | Available container images don’t have any high or critical vulnerabilities | Available container images don’t have any high or critical vulnerabilities |
| CT-12 | Validate artifact signatures and digests | Validate artifact signatures and digests |
| CT-13 | Scan deployed images in production | Scan deployed images in production |

## Detailed Controls

### Control: Restrict administrative access to CI/CD tools (ID: `CT-1`)
**Description**: Restrict administrative access to CI/CD tools

#### Rules

| Rule ID | Rule Name | Rule Description |
|---------|----------|------------------|
| gitlab-org-max-admins | [Limit Admins in GitLab Organization](../rules/gitlab/org/max-admins.md) | Verify the maximum number of admins for the GitLab project is restricted. |

### Control: Only accept commits signed with a developer GPG key (ID: `CT-2`)
**Description**: Only accept commits signed with a developer GPG key

#### Rules

| Rule ID | Rule Name | Rule Description |
|---------|----------|------------------|
| gitlab-project-disallow-unsigned-commits | [Reject Unsigned Commits in GitLab Project](../rules/gitlab/project/reject-unsigned-commits.md) | Verify `reject_unsigned_commits` is enabled for the GitLab project. |
| gitlab-project-signed-commits | [Ensure All Commits Are Signed in GitLab Project](../rules/gitlab/project/check-signed-commits.md) | Verify all commits in the GitLab project are signed. |

### Control: Automation access keys expire automatically (ID: `CT-3`)
**Description**: Automation access keys expire automatically

#### Rules

| Rule ID | Rule Name | Rule Description |
|---------|----------|------------------|
| gitlab-org-token-excessive-lifespan | [Forbid Long-Lived Tokens in GitLab Organization](../rules/gitlab/org/longlive-tokens.md) | Verify no GitLab organization tokens have an excessively long lifespan. |

### Control: Reduce automation access to read-only (ID: `CT-4`)
**Description**: Reduce automation access to read-only

#### Rules

| Rule ID | Rule Name | Rule Description |
|---------|----------|------------------|
| gitlab-org-disallowed-token-scope | [Forbid Token Scopes in GitLab Organization](../rules/gitlab/org/forbid-token-scopes.md) | Verify no GitLab organization tokens have disallowed scopes. |

### Control: Any critical or high severity vulnerability breaks the build (ID: `CT-6`)
**Description**: Any critical or high severity vulnerability breaks the build

#### Rules

| Rule ID | Rule Name | Rule Description |
|---------|----------|------------------|
| scribe-cve | [Verify No Critical or High Vulnerabilities](../rules/api/scribe-api-cve.md) | Verify via Scribe API that there no critical or high severity vulnerabilities in the target artifact (container image, folder, etc.). |

### Control: Validate artifact digest (ID: `CT-8`)
**Description**: Validate artifact digest

#### Rules

| Rule ID | Rule Name | Rule Description |
|---------|----------|------------------|
|  |  |  |

### Control: Pull-requests require two reviewers (including one default reviewer) and a passing build to be merged (ID: `CT-9`)
**Description**: Pull-requests require two reviewers (including one default reviewer) and a passing build to be merged

#### Rules

| Rule ID | Rule Name | Rule Description |
|---------|----------|------------------|
| gitlab-project-merge-approval | [Merge approval policy check for GitLab project](../rules/gitlab/project/approvals-policy-check.md) | Verify the project's merge approval policy complies with requirements. |

### Control: Available container images don’t have any high or critical vulnerabilities (ID: `CT-11`)
**Description**: Available container images don’t have any high or critical vulnerabilities

#### Rules

| Rule ID | Rule Name | Rule Description |
|---------|----------|------------------|
| scribe-cve | [Verify No Critical or High Vulnerabilities](../rules/api/scribe-api-cve.md) | Verify via Scribe API that there no critical or high severity vulnerabilities in the target artifact (container image, folder, etc.). |

### Control: Validate artifact signatures and digests (ID: `CT-12`)
**Description**: Validate artifact signatures and digests

#### Rules

| Rule ID | Rule Name | Rule Description |
|---------|----------|------------------|
| sbom-signed | [Require SBOM Signature](../rules/sbom/artifact-signed.md) | Verify the SBOM is signed. |

### Control: Scan deployed images in production (ID: `CT-13`)
**Description**: Scan deployed images in production

#### Rules

| Rule ID | Rule Name | Rule Description |
|---------|----------|------------------|
| sbom-signed | [Require SBOM Signature](../rules/sbom/artifact-signed.md) | Verify the SBOM is signed. |
| sbom-disallow-dependencies | [Restrict Disallowed Dependencies](../rules/sbom/blocklist-packages.md) | Verify the number of disallowed dependencies remains below the specified threshold. |
| scribe-cve | [Verify No Critical or High Vulnerabilities](../rules/api/scribe-api-cve.md) | Verify via Scribe API that there no critical or high severity vulnerabilities in the target artifact (container image, folder, etc.). |
