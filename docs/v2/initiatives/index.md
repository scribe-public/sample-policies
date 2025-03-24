# Documentation Index

## Initiatives

<!-- START TABLE -->
| Name | Description |
|------|-------------|
| [Blueprint for Secure Pipelines](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/bp1) | Blueprint for secure pipelines - Gitlab |
| [SLSA L1 Framework](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/slsa.l1) | Evaluate SLSA Level 1 |
| [NIST Supply Chain Integrity Initiative](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/sp-800-53) | This initiative enforces key supply chain requirements from NIST SP 800-53. It mandates that container builds include:   - A Software Bill of Materials (SBOM) to ensure component inventory and traceability,     addressing requirements from SR-4 and CM-8.   - Provenance data to support architectural traceability, as outlined in SA-8. Both the SBOM and the provenance artifacts must be cryptographically signed to meet integrity requirements specified in SA-12. |
| [SSDF Client Initiative](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/ssdf) | Evaluate PS rules from the SSDF initiative |
| [NIST Application Container Security Initiative](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/sp-800-190) | This initiative enforces container security controls as outlined in  NIST SP 800-190. It ensures that containerized applications follow  security best practices, including vulnerability scanning, trusted  image sources, registry security, and proper configuration to minimize risk. The initiative enables policy-driven enforcement of security controls  throughout the software development lifecycle (SDLC), providing real-time  feedback to developers and enforcement in CI/CD pipelines. |
| [SLSA L2 Framework](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/slsa.l2) | Evaluate SLSA Level 2 |

## Rules

### SBOM
**Evidence Type:** [SBOM](https://deploy-preview-299--scribe-security.netlify.app/docs/valint/sbom)

| Rule Name | Description |
|-----------|-------------|
| [Apply Scribe Template Policy](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/api/scribe-api) | Verify XX using the Scribe API template rule. |
| [Scribe Published Policy](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/api/scribe-api-published) | Verify image Scribe Publish flag is set for container image. |
| [NTIA SBOM Compliance Check](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/sbom/NTIA-compliance) | Validates that SBOM metadata meets basic NTIA requirements for authors and supplier.  |
| [Enforce SBOM Freshness](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/sbom/fresh-sbom) | Verify the SBOM is not older than the specified duration. |
| [Require SBOM Existence](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/sbom/evidence-exists) | Verify the SBOM exists as evidence. |
| [Require SBOM Signature](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/sbom/artifact-signed) | Verify the SBOM is signed. |
| [Require SBOM Existence](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/sbom/require-sbom) | Verify the SBOM exists as evidence. |

### Image SBOM
**Evidence Type:** [Image SBOM](https://deploy-preview-299--scribe-security.netlify.app/docs/valint/sbom)

| Rule Name | Description |
|-----------|-------------|
| [Verify File Integrity](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/multievidence/files_integrity) | Verify the checksum of each file in one SBOM matches the checksum in a second SBOM. |
| [Verify Image Labels](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/images/verify-labels) | Verify specified labels key-value pairs exist in the image. |
| [Forbid Large Images](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/images/forbid-large-images) | Verify the image size is below the specified threshold. |
| [Disallow Container Shell Entrypoint](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/images/restrict-shell-entrypoint) | Verify the container image disallows shell entrypoint. |
| [Fresh Base Image](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/images/fresh-base-image) | Verifies that each base image is not older than the specified threshold (max_days) from its creation date. |
| [Banned Ports](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/images/banned-ports) | Ensures that the container image does not expose ports that are disallowed by organizational policy. The rule examines properties in the SBOM metadata and checks each value (expected in the format "port/protocol") against a provided banned ports list. It fails if any banned port is exposed or if no banned ports list is provided.  |
| [Disallow Specific Users in SBOM](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/images/banned-users) | Verify specific users are not allowed in an SBOM. |
| [Restrict Build Scripts](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/images/blocklist-build-scripts) | Verify no build scripts commands appear in block list. |
| [Registry Connection HTTPS](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/images/enforce-https-registry) | Checks if the container's registry scheme is HTTPS |
| [Require Image Labels](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/images/verify-labels-exist) | Verify the image has the specified labels. |
| [Require Healthcheck](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/images/require-healthcheck) | Checks that the container image includes at least one healthcheck property. |
| [Allowed Base Image](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/images/allowed-base-image) | Verifies that every base image is from an approved source. The rule returns a summary including the component names and versions of valid base images, or lists the invalid ones. This rule requires Dockerfile context; for example, run it with: `valint my_image --base-image Dockerfile`.  |
| [Fresh Image](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/images/fresh-image) | Verify the image is not older than the specified threshold. |
| [Allowed Main Image Source](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/images/allowed-image-source) | Ensures the main container image referenced in the SBOM is from an approved source.  |
| [Require Signed Container Image](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/images/image-signed) | Enforces that container images (target_type=container) are cryptographically signed.  |
| [Verify No Critical or High Vulnerabilities](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/api/scribe-api-cve) | Verify via Scribe API that there no critical or high severity vulnerabilities in the target artifact (container image, folder, etc.). |
| [Disallow Specific Users in SBOM](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/sbom/banned-users) | Verify specific users are not allowed in an SBOM. |
| [Enforce SBOM Dependencies](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/sbom/required-packages) | Verify the artifact includes all required dependencies. |
| [Enforce SBOM License Completeness](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/sbom/complete-licenses) | Verify all dependencies in the artifact have a license. |
| [Restrict Disallowed SBOM Licenses](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/sbom/banned-licenses) | Verify the number of disallowed licenses in SBOM dependencies remains below the specified threshold. |
| [Enforce Allowed SBOM Components](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/sbom/allowed-components) | Verify the artifact contains only allowed components. |
| [Require Specified SBOM Licenses](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/sbom/verify-huggingface-license) | Verify the artifact includes all specified licenses. |
| [Restrict Disallowed Dependencies](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/sbom/blocklist-packages) | Verify the number of disallowed dependencies remains below the specified threshold. |

### Git SBOM
**Evidence Type:** [Git SBOM](https://deploy-preview-299--scribe-security.netlify.app/docs/valint/sbom)

| Rule Name | Description |
|-----------|-------------|
| [Restrict Coding Permissions](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/git/coding-permissions) | Verify only allowed users committed to the repository. |
| [Required Git Evidence Exists](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/git/evidence-exists) | Verify required Git evidence exists. |
| [Git Artifact Signed](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/git/artifact-signed) | Verify the Git artifact is signed. |
| [Disallow Commits to Main Branch](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/git/no-commit-to-main) | Verify commits made directly to the main branch are disallowed. |
| [Disallow Unsigned Commits](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/git/no-unsigned-commits) | Verify all commits are signed. |

### SARIF Evidence
**Evidence Type:** [SARIF Evidence](https://deploy-preview-299--scribe-security.netlify.app/docs/valint/sarif)

| Rule Name | Description |
|-----------|-------------|
| [Verify Attack Vector Exists in SARIF](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/sarif/verify-attack-vector) | Verify required evidence validates attack vectors in the SARIF report. |
| [Verify IaC Misconfiguration Threshold in SARIF](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/sarif/report-iac-errors) | Verify the number of infrastructure-as-code (IaC) errors in the SARIF report remains below the specified threshold. |
| [Verify Required Evidence in SARIF](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/sarif/evidence-exists) | Verify all required evidence exists as defined by the SARIF policy. |
| [Verify Artifact Signature in SARIF](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/sarif/artifact-signed) | Verify the artifact referenced in the SARIF report is signed to confirm its integrity. |
| [Verify Rule Compliance in SARIF](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/sarif/verify-sarif) | Verify the SARIF report complies with defined generic rules for compliance and security. vulnerability profiles. |
| [Verify Tool Evidence in SARIF](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/sarif/verify-tool-evidence) | Verify required tools were used to generate the SARIF report. |
| [Verify Semgrep Rule in SARIF](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/sarif/verify-semgrep-report) | Verify the Semgrep SARIF report complies with predefined rules to ensure compliance and detect issues. |
| [Verify Trivy SARIF Report Compliance](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/sarif/trivy/verify-trivy-report) | Verify the Trivy SARIF report complies with predefined rules to ensure compliance and detect issues. |
| [Verify IaC Misconfiguration Threshold in Trivy SARIF](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/sarif/trivy/report-trivy-iac-errors) | Verify the number of infrastructure-as-code (IaC) errors in the Trivy SARIF report remains below the specified threshold. |
| [Trivy Blocklist CVE Check](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/sarif/trivy/blocklist-cve) | Verify a CVE Blocklist against a SARIF report |
| [Trivy Vulnerability Findings Check](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/sarif/trivy/verify-cve-severity) | Verifies that vulnerability findings in the SARIF evidence from Trivy do not exceed the defined severity threshold.  |
| [Verify Attack Vector Threshold in Trivy SARIF](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/sarif/trivy/verify-trivy-attack-vector) | Verify no attack vector in the Trivy SARIF report exceeds the specified threshold. |
| [SARIF Update Needed](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/sarif/patcheck/updates-needed) | Verify no security packages require updates. |
| [K8s Jailbreak](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/generic/k8s-jailbreak) | Verify no misconfigurations from the prohibited ids list in the Kuberentes scan is below specified threshold |

### Generic Statement
**Evidence Type:** [Generic Statement](https://deploy-preview-299--scribe-security.netlify.app/docs/valint/generic)

| Rule Name | Description |
|-----------|-------------|
| [Required Trivy Evidence Exists](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/generic/trivy-exists) | Verify required Trivy evidence exists |
| [Required Generic Evidence Exists](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/generic/evidence-exists) | Verify required evidence exists. |
| [Generic Artifact Signed](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/generic/artifact-signed) | Verify required evidence is signed. |

### Github Organization Discovery Evidence
**Evidence Type:** [Github Organization Discovery Evidence](https://deploy-preview-299--scribe-security.netlify.app/docs/platforms/discover#github-discovery)

| Rule Name | Description |
|-----------|-------------|
| [Verify members_can_create_repositories setting](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/github/org/create-repos) | Verify `members_can_create_repositories` is appropriately configured in the GitHub repository. |
| [Verify `secret_scanning_push_protection` Setting](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/github/org/push-protection-sa) | Verify `secret_scanning_push_protection` is configured in the GitHub repository. |
| [Verify `secret_scanning_validity_checks_enabled` Setting](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/github/org/validity-checks) | Verify `secret_scanning_validity_checks` is configured in the GitHub repository. |
| [Verify dependabot_security_updates_enabled_for_new_repositories setting](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/github/org/dependabot-security-updates) | Verify Dependabot security updates for new repositories are configured in the GitHub organization. |
| [Verify `secret_scanning` Setting in `security_and_analysis`](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/github/org/secret-scanning-sa) | Verify `secret_scanning` is configured in the GitHub repository. |
| [Limit Admin Number in GitHub Organization](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/github/org/max-admins) | Verify the maximum number of GitHub organization admins is restricted. |
| [Verify `advanced_security_enabled_for_new_repositories` setting](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/github/org/advanced-security) | Verify `advanced_security` is enabled for new repositories in the GitHub organization. |
| [Verify dependency_graph_enabled_for_new_repositories setting](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/github/org/dependency-graph) | Verify `dependency_graph` is enabled for new repositories in the GitHub organization. |
| [Verify GitHub Organization Requires Signoff on Web Commits](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/github/org/web-commit-signoff) | Verify contributors sign commits through the GitHub web interface. |
| [Verify two_factor_requirement_enabled setting](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/github/org/2fa) | Verify `two_factor_requirement` is enabled in the GitHub organization. |
| [Verify GitHub Organization Secrets Are Not Too Old](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/github/org/old-secrets) | Verify secrets in the GitHub organization are not older than the specified threshold. |
| [Allowed GitHub Organization Admins](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/github/org/allow-admins) | Verify only users in the Allowed List have admin privileges in the GitHub organization. |
| [Verify secret_scanning_enabled_for_new_repositories setting](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/github/org/secret-scanning) | Verify `secret_scanning` is enabled for new repositories in the GitHub organization. |
| [Allowed GitHub Organization Users](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/github/org/allow-users) | Verify only users in the Allowed List have user access to the GitHub organization. |
| [Verify `secret_scanning_push_protection_custom_link_enabled` Setting](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/github/org/pp-custom-link) | Verify `secret_scanning_push_protection_custom_link` is enabled in the GitHub organization. |
| [Verify dependabot_security_updates setting in security_and_analysis](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/github/org/dependabot-security-updates-sa) | Verify Dependabot security updates are configured in the GitHub organization. |
| [Verify members_can_create_private_repositories setting](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/github/org/create-private-repos) | Verify `members_can_create_private_repositories` is configured in the GitHub organization (supported only in GitHub Enterprise). |
| [Verify Repo Visibility Setting](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/github/org/repo-visibility) | Verify only repositories in the Allowed List are public in the GitHub organization. |
| [Verify `secret_scanning_validity_checks` Setting in `security_and_analysis`](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/github/org/validity-checks-sa) | Verify `secret_scanning_validity_checks` is configured in the GitHub organization. |
| [Verify `secret_scanning_push_protection_enabled_for_new_repositories` Setting](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/github/org/push-protection) | Verify `secret_scanning_push_protection` is enabled for new repositories in the GitHub organization. |
| [Verify dependabot_alerts_enabled_for_new_repositories setting](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/github/org/dependabot-alerts) | Verify Dependabot alerts for new repositories are enabled in the GitHub organization. |

### Github Repository Discovery Evidence
**Evidence Type:** [Github Repository Discovery Evidence](https://deploy-preview-299--scribe-security.netlify.app/docs/platforms/discover#github-discovery)

| Rule Name | Description |
|-----------|-------------|
| [Verify secret scanning.](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/github/repository/validity-checks) | Verify both `secret_scanning_validity_checks` and `security_and_analysis` are set in GitHub organization and all the repositories. |
| [Verify Dependabot security updates setting](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/github/repository/dependabot) | Verify Dependabot security updates are configured in the GitHub repository. |
| [Verify Repository Is Private](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/github/repository/repo-private) | Verify the GitHub repository is private. |
| [Verify Repository Requires Commit Signoff](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/github/repository/web-commit-signoff) | Verify contributors sign off on commits to the GitHub repository through the GitHub web interface. |
| [Verify Default Branch Protection](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/github/repository/default-branch-protection) | Verify the default branch protection is configured in the GitHub repository. |
| [Verify No Old Secrets Exist in Repository](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/github/repository/old-secrets) | Verify secrets in the GitHub repository are not older than the specified threshold. |
| [Verify No Organization Secrets Exist in Repository](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/github/repository/no-org-secrets) | Verify no organization secrets exist in the GitHub repository. |
| [Verify Branch Verification Setting](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/github/repository/branch-verification) | Verify branch verification in the GitHub repository matches the value defined in the configuration file. |
| [Verify Branch Protection Setting](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/github/repository/branch-protection) | Verify branch protection is configured in the GitHub repository. |
| [Verify All Commits Are Signed in Repository](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/github/repository/signed-commits) | Verify all commits are signed in a repository attestation. |
| [Verify secret_scanning setting](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/github/repository/secret-scanning) | Verify `secret_scanning` is configured in the GitHub repository. |
| [Verify No Cache Usage Exists in Repository](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/github/repository/no-cache-usage) | Verify the GitHub repository has no cache usage. |
| [Verify All Commits Are Signed in Repository](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/github/repository/check-signed-commits) | Verify all commits in the GitHub repository are signed. |
| [Verify Only Ephemeral Runners Exist in Repository](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/github/repository/ephemeral-runners-only) | Verify self-hosted runners are disallowed in the GitHub repository. |
| [Allowed Public Repositories](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/github/repository/visibility) | Verify only GitHub repositories in the Allowed List are public. |
| [Verify Push Protection Setting](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/github/repository/push-protection) | Verify `secret_scanning_push_protection` is configured in the GitHub repository. |

### Gitlab Organization Discovery Evidence
**Evidence Type:** [Gitlab Organization Discovery Evidence](https://deploy-preview-299--scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery)

| Rule Name | Description |
|-----------|-------------|
| [Limit Admins in GitLab Organization](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/gitlab/org/max-admins) | Verify the maximum number of admins for the GitLab project is restricted. |
| [Ensure Active Projects in GitLab Organization](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/gitlab/org/inactive-projects) | Verify no GitLab organization projects are inactive. |
| [Restrict Public Visibility in GitLab Organization](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/gitlab/org/projects-visibility) | Verify only allowed projects in the GitLab organization have public visibility. |
| [Allowed Admins in GitLab Organization](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/gitlab/org/allow-admins) | Verify only users in the Allowed List have admin privileges in the GitLab organization. |
| [Forbid Long-Lived Tokens in GitLab Organization](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/gitlab/org/longlive-tokens) | Verify no GitLab organization tokens have an excessively long lifespan. |
| [Forbid Unused Tokens in GitLab Organization](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/gitlab/org/unused-tokens) | Verify there are no unused GitLab organization tokens. |
| [Allowed Users in GitLab Organization](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/gitlab/org/allow-users) | Verify only users in the Allowed List have access to the GitLab organization. |
| [Restrict Token Scopes in GitLab](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/gitlab/org/allow-token-scopes) | Verify all tokens in the GitLab organization are restricted to allowed scopes to prevent excessive permission. |
| [Block Users in GitLab Organization](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/gitlab/org/blocked-users) | Verify no users in the GitLab organization are on the block list. |
| [Prevent Token Expiration in GitLab Organization](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/gitlab/org/expiring-tokens) | Verify no GitLab organization tokens are about to expire. |
| [Forbid Token Scopes in GitLab Organization](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/gitlab/org/forbid-token-scopes) | Verify no GitLab organization tokens have disallowed scopes. |

### Gitlab Project Discovery Evidence
**Evidence Type:** [Gitlab Project Discovery Evidence](https://deploy-preview-299--scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery)

| Rule Name | Description |
|-----------|-------------|
| [Merge approval policy check for GitLab project](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/gitlab/project/approvals-policy-check) | Verify the project's merge approval policy complies with requirements. |
| [Set Push Rules for GitLab Project](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/gitlab/project/push-rules-set) | Verify push rules are set for the GitLab project. |
| [Disable Committers' Approval for Merge Requests in GitLab](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/gitlab/project/merge-requests-disable-committers-approval) | Verify `merge_requests_disable_committers_approval` is set for the GitLab project. |
| [Restrict Commit Authors in GitLab Project](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/gitlab/project/commit-author-email-check) | Verify only GitLab project users in the Allowed List have commit author permissions. |
| [Require Minimal Approvers in GitLab Project](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/gitlab/project/required-minimal-approvers) | Verify the required number of approvers for the GitLab project is met. |
| [Enforce Medium Severity Limit](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/gitlab/project/medium-severity-limit) | Verify the maximum allowed medium severity alerts for the GitLab project. |
| [Enforce Merge Access Level Policy for GitLab Project](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/gitlab/project/merge-access-level) | Verify the GitLab project's merge access level complies with requirements. |
| [Set Author Email Regex in GitLab Project](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/gitlab/project/author-email-regex) | Verify the `author_email_regex` for the GitLab project is set to the specified value. |
| [Check CWE Compliance](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/gitlab/project/check-cwe) | Verify that specified CWEs were not detected in the GitLab project. |
| [Enforce Critical Severity Limit](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/gitlab/project/critical-severity-limit) | Verify the maximum allowed critical severity alerts for the GitLab project. |
| [Verify Commit Message Format](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/gitlab/project/commit-message-check) | Verify that commit messages in the GitLab project adhere to the specified format template. |
| [Enable Member Check for GitLab Project](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/gitlab/project/member-check) | Verify `member_check` is enabled for the GitLab project. |
| [Restrict Selective Code Owner Removals in GitLab](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/gitlab/project/selective-code-owner-removals) | Verify `selective_code_owner_removals` is set for the GitLab project. |
| [Run Secrets Scanning in GitLab Project](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/gitlab/project/secrets-scanning) | Verify secrets scanning is performed for the GitLab project. |
| [Reset Approvals on Push in GitLab Project](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/gitlab/project/reset-pprovals-on-push) | Verify `reset_approvals_on_push` is set for the GitLab project. |
| [Reject Unsigned Commits in GitLab Project](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/gitlab/project/reject-unsigned-commits) | Verify `reject_unsigned_commits` is enabled for the GitLab project. |
| [Enable Commit Committer Check in GitLab Project](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/gitlab/project/commit-committer-check) | Verify `commit_committer_check` is enabled for the GitLab project. |
| [Protect CI Secrets in GitLab Project](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/gitlab/project/protect-ci-secrets) | Verify secrets in the GitLab project are not shared. |
| [Validate All Commits in GitLab Project](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/gitlab/project/commits-validated) | Verify all commits in the GitLab project are validated. |
| [Disallow Banned Approvers](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/gitlab/project/disallowed-banned-approvers) | Verify approvers in the GitLab project are not on the banned list. |
| [Allowed Committer Emails in GitLab Project](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/gitlab/project/committer-email-check) | Verify only users in the Allowed List use committer email addresses in the GitLab project. |
| [Set Push Access Level in GitLab Project](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/gitlab/project/push-access-level) | Verify the GitLab project's push access level policy complies with requirements. |
| [Disallow Force Push in GitLab Project](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/gitlab/project/force-push-protection) | Verify force pushes in the GitLab project are disallowed to maintain repository integrity. |
| [Set Visibility Level in GitLab Project](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/gitlab/project/visibility-check) | Verify the GitLab project's visibility matches the required level. |
| [Restrict Approvers Per Merge Request](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/gitlab/project/approvers-per-merge-request) | Verify the binary field `disable_overriding_approvers_per_merge_request` is set for the GitLab project. |
| [Allowed Commit Authors in GitLab Project](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/gitlab/project/commit-author-name-check) | Verify only users in the Allowed List author commits in the GitLab project. |
| [Disable Author Approval for Merge Requests in GitLab](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/gitlab/project/merge-requests-author-approval) | Verify the binary field `merge_requests_author_approval` is set for the GitLab project. |
| [Enable Secrets Prevention in GitLab Project](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/gitlab/project/prevent-secrets-check) | Verify `prevent_secrets` is enabled for the GitLab project. |
| [Ensure All Commits Are Signed in GitLab Project](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/gitlab/project/check-signed-commits) | Verify all commits in the GitLab project are signed. |
| [Check Description Substring](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/gitlab/project/description-substring-check) | Verify a specific substring is not found in the description attribute of vulnerabilities for the GitLab project. |
| [Verify Project Activity](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/gitlab/project/abandoned-project) | Verify the GitLab project is active for a specified duration. |
| [Allowed Committer Names in GitLab Project](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/gitlab/project/committer-name-check) | Verify only users in the Allowed List commit by name in the GitLab project. |
| [Check Message Substring](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/gitlab/project/message-substring-check) | Verify a specific substring is not found in the message attribute of vulnerabilities for the GitLab project. |
| [Run SAST Scanning in GitLab Project](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/gitlab/project/sast-scanning) | Verify SAST scanning is performed for the GitLab project. |
| [Require Code Owner Approval in GitLab Project](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/gitlab/project/co-approval-required) | Verify code owner approval is required for specific branches in the GitLab project. |
| [Ensure SAST Scanning Passes](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/gitlab/project/sast-scan-pass) | Verify SAST scanning is successful for the GitLab project. |
| [Ensure Secrets Scanning Passes](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/gitlab/project/secrets-scan-pass) | Verify secrets scanning is successful for the GitLab project. |
| [Require Password for Approvals in GitLab Project](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/gitlab/project/require-password-to-approve) | Verify the binary field `require_password_to_approve` is set for the GitLab project. |

### K8s Namespace Discovery Evidence
**Evidence Type:** [K8s Namespace Discovery Evidence](https://deploy-preview-299--scribe-security.netlify.app/docs/platforms/discover#k8s-discovery)

| Rule Name | Description |
|-----------|-------------|
| [Allowed Container Images](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/k8s/namespace/allowed-images) | Verify only container images specified in the Allowed List run within the Kubernetes namespace. |
| [Verify Namespace Termination](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/k8s/namespace/verify-namespace-termination) | Verify Kubernetes namespaces are properly terminated to prevent lingering resources and maintain cluster hygiene. |
| [Allowed Namespaces](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/k8s/namespace/white-listed-namespaces) | Verify only namespaces specified in the Allowed List are allowed within the cluster. |
| [Verify Namespace Runtime Duration](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/k8s/namespace/verify-namespace-duration) | Verify Kubernetes namespaces adhere to a specified runtime duration to enforce lifecycle limits. |
| [Allowed Namespace Registries](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/k8s/namespace/allowed-registries) | Verify container images in Kubernetes namespaces originate from registries in the Allowed List. |
| [Allowed Pods in Namespace](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/k8s/namespace/white-listed-pod) | Verify only pods explicitly listed in the Allowed List run within a Kubernetes namespace. |

### K8s Pod Discovery Evidence
**Evidence Type:** [K8s Pod Discovery Evidence](https://deploy-preview-299--scribe-security.netlify.app/docs/platforms/discover#k8s-discovery)

| Rule Name | Description |
|-----------|-------------|
| [Verify Pod Runtime Duration](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/k8s/pods/verify-pod-duration) | Verify Kubernetes pods adhere to a specified runtime duration to enforce lifecycle limits. |
| [Verify Pod Termination](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/k8s/pods/verify-pod-termination) | Verify Kubernetes pods are properly terminated to prevent lingering resources and maintain cluster hygiene. |
| [Allowed Pods](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/k8s/pods/white-listed-pod) | Verify only pods explicitly listed in the Allowed List are allowed to run. |

### Bitbucket Project Discovery Evidence
**Evidence Type:** [Bitbucket Project Discovery Evidence](https://deploy-preview-299--scribe-security.netlify.app/docs/platforms/discover#bitbucket-discovery)

| Rule Name | Description |
|-----------|-------------|
| [Prevent Long-Lived Tokens](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/bitbucket/project/long-live-tokens) | Verify Bitbucket API tokens expire before the maximum time to live. |
| [Allowed Project Admins](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/bitbucket/project/allow-admins) | Verify only users specified in the Allowed List have admin privileges in the Bitbucket project. |
| [Allowed Project Users](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/bitbucket/project/allow-users) | Verify only users specified in the Allowed List have user access to the Bitbucket project. |
| [Prevent Credential Exposure](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/bitbucket/project/exposed-credentials) | Verify access to the Bitbucket project is blocked if exposed credentials are detected. |

### Bitbucket Repository Discovery Evidence
**Evidence Type:** [Bitbucket Repository Discovery Evidence](https://deploy-preview-299--scribe-security.netlify.app/docs/platforms/discover#bitbucket-discovery)

| Rule Name | Description |
|-----------|-------------|
| [Allowed Repository Admins](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/bitbucket/repository/allow-admins) | Verify only users specified in the Allowed List have admin privileges in the Bitbucket repository. |
| [Verify Default Branch Protection Setting Is Configured](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/bitbucket/repository/branch-protection) | Verify the default branch protection is enabled in the Bitbucket repository. |
| [Allowed Repository Users](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/bitbucket/repository/allow-users) | Verify only users specified in the Allowed List have user access to the Bitbucket repository. |

### Bitbucket Workspace Discovery Evidence
**Evidence Type:** [Bitbucket Workspace Discovery Evidence](https://deploy-preview-299--scribe-security.netlify.app/docs/platforms/discover#bitbucket-discovery)

| Rule Name | Description |
|-----------|-------------|
| [Allowed Workspace Admins](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/bitbucket/workspace/allow-admins) | Verify only users specified in the Allowed List have admin privileges in the Bitbucket workspace. |
| [Allowed Workspace Users](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/bitbucket/workspace/allow-users) | Verify only users specified in the Allowed List have user access to the Bitbucket workspace. |

### Discovery Evidence
**Evidence Type:** [Discovery Evidence](https://deploy-preview-299--scribe-security.netlify.app/docs/platforms/discover)

| Rule Name | Description |
|-----------|-------------|
| [Verify GitLab Pipeline Labels](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/gitlab/pipeline/verify-labels) | Verify the pipeline includes all required label keys and values. |
| [GitLab pipeline verify labels exist](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/gitlab/pipeline/verify-labels-exist) | Verify the pipeline has all required label keys and values. |
| [Verify Exposed Credentials](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/jenkins/folder/exposed-credentials) | Verify there are no exposed credentials. |

### Dockerhub Project Discovery Evidence
**Evidence Type:** [Dockerhub Project Discovery Evidence](https://deploy-preview-299--scribe-security.netlify.app/docs/platforms/discover#dockerhub-discovery)

| Rule Name | Description |
|-----------|-------------|
| [Verify DockerHub Tokens are Active](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/dockerhub/token-expiration) | Verify that all discovered Dockerhub tokens are set to Active in Dockerhub. |
| [Verify no unused Dockerhub](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/dockerhub/token-not-used) | Verify that there are no unused Dockerhub. |

### Jenkins Instance Discovery Evidence
**Evidence Type:** [Jenkins Instance Discovery Evidence](https://deploy-preview-299--scribe-security.netlify.app/docs/platforms/discover#jenkins-discovery)

| Rule Name | Description |
|-----------|-------------|
| [Disallow Unused Users](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/jenkins/instance/unused-users) | Verify there are no users with zero activity. |
| [Verify Inactive Users](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/jenkins/instance/inactive-users) | Verify there are no inactive users. |

### SLSA Provenance
**Evidence Type:** [SLSA Provenance](https://deploy-preview-299--scribe-security.netlify.app/docs/valint/help/valint_slsa)

| Rule Name | Description |
|-----------|-------------|
| [Verify that provenance is authenticated](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/slsa/l2-provenance-authenticated) | Verify the artifact is signed. |
| [SLSA Field Exists in Provenance Document](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/slsa/field-exists) | Verify the specified field exists in the provenance document. |
| [Verify Provenance Document Exists](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/slsa/l1-provenance-exists) | Verify that the Provenance document evidence exists. |
| [Disallow dependencies in SLSA Provenance Document](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/slsa/banned-builder-deps) | Verify that dependencies in the block list do not appear in the SLSA Proveance document. |
| [Verify build time](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/slsa/build-time) | Verify the artifact was created within the specified time window. |
| [Verify that artifact was created by the specified builder](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/slsa/verify-builder) | Verify the artifact was created by the specified builder. |
| [Verify that artifact has no disallowed builder dependencies](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/slsa/verify-byproducts) | Verify the artifact has no disallowed builder dependencies. |

### Statement
**Evidence Type:** [Statement](https://deploy-preview-299--scribe-security.netlify.app/docs/valint/generic)

| Rule Name | Description |
|-----------|-------------|
| [Verify Selected Commits Are Signed API](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/github/api/signed-commits-list) | Verify selected commits are signed in the GitHub organization. |
| [Branch protection enabled in GitHub repository](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/github/api/branch-protection) | Verify GitHub branch protection rules |
| [Disallow Unsigned Commits In Time Range](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/github/api/signed-commits-range) | Verify commits in the specified time range are signed. |
| [Branch protected](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/ssdf/ps-1-branch-protection) | PS.1 Require branch protection for the repository |
| [Image-verifiable](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/ssdf/ps-2-image-verifiable) | PS.2 Provide a mechanism to verify the integrity of the image |
| [Require signoff on web commits](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/ssdf/ps-1-web-commit-signoff) | PS.1 Require contributors to sign when committing to Github through the web interface |
| [SBOM archived](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/ssdf/ps-3.2-archived-sbom) | PS.3.2 Archive SBOM |
| [Repo private](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/ssdf/ps-1-repo-private) | PS.1 Assure the repository is private |
| [Limit admins](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/ssdf/ps-1-limit-admins) | PS.1 Restrict the maximum number of organization admins |
| [Enforce 2FA](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/ssdf/ps-1-2fa) | PS.1 Require 2FA for accessing code |
| [Code archived](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/ssdf/ps-3.1-code-archived) | PS.3.1 Verify that the software release data is archived. We assume running in Github thus the code is allways stored in a repository  |
| [Sign Selected Commits in GitLab](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/gitlab/api/signed-commits-list) | Verify the selected commits are signed in the GitLab organization. |
| [Set Push Rules in GitLab](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/gitlab/api/push-rules) | Verify GitLab push rules are configured via the API. |
| [Sign Selected Commit Range in GitLab](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/gitlab/api/signed-commits-range) | Verify the selected range of commits is signed via the GitLab API. |
| [Verify No Critical or High Vulnerabilities in Product](https://deploy-preview-299--scribe-security.netlify.app/docs/configuration/initiatives/rules/api/scribe-api-cve-product) | Verify via Scribe API that there no critical or high severity vulnerabilities in any deliverable component of the product. |
