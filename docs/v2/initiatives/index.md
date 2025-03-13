# Documentation Index

## Initiatives

| Name | Description |
|------|-------------|
| [SLSA L1 Framework](https://scribe-security.netlify.app/docs/docs/configuration/initiatives/slsa.l1.md) | Evaluate SLSA Level 1 |
| [NIST Application Container Security Initiative](https://scribe-security.netlify.app/docs/docs/configuration/initiatives/sp-800-190.md) | This initiative enforces container security controls as outlined in  NIST SP 800-190. It ensures that containerized applications follow  security best practices, including vulnerability scanning, trusted  image sources, registry security, and proper configuration to minimize risk. The initiative enables policy-driven enforcement of security controls  throughout the software development lifecycle (SDLC), providing real-time  feedback to developers and enforcement in CI/CD pipelines.<br/> |
| [SLSA L2 Framework](https://scribe-security.netlify.app/docs/docs/configuration/initiatives/slsa.l2.md) | Evaluate SLSA Level 2 |
| [NIST Supply Chain Integrity Initiative](https://scribe-security.netlify.app/docs/docs/configuration/initiatives/sp-800-53.md) | This initiative enforces key supply chain requirements from NIST SP 800-53. It mandates that container builds include:<br/>  - A Software Bill of Materials (SBOM) to ensure component inventory and traceability,<br/>    addressing requirements from SR-4 and CM-8.<br/>  - Provenance data to support architectural traceability, as outlined in SA-8.<br/>Both the SBOM and the provenance artifacts must be cryptographically signed to meet integrity requirements specified in SA-12.<br/> |
| [Blueprint for Secure Pipelines](https://scribe-security.netlify.app/docs/docs/configuration/initiatives/bp1.md) | Blueprint for secure pipelines - Gitlab |
| [SSDF Client Initiative](https://scribe-security.netlify.app/docs/docs/configuration/initiatives/ssdf.md) | Evaluate PS rules from the SSDF initiative |

## Rules

| Rule Name | Description | Evidence Type |
|-----------|-------------|---------------|
| Restrict Disallowed SBOM Licenses | Verify the number of disallowed licenses in SBOM dependencies remains below the specified threshold. | [SBOM](https://scribe-security.netlify.app/docs/valint/sbom) |
| Enforce SBOM Freshness | Verify the SBOM is not older than the specified duration. | [SBOM](https://scribe-security.netlify.app/docs/valint/sbom) |
| Require Specified SBOM Licenses | Verify the artifact includes all specified licenses. | [SBOM](https://scribe-security.netlify.app/docs/valint/sbom) |
| Enforce SBOM Dependencies | Verify the artifact includes all required dependencies specified as a list of PURLs. | [SBOM](https://scribe-security.netlify.app/docs/valint/sbom) |
| NTIA SBOM Compliance Check | Validates that SBOM metadata meets basic NTIA requirements for authors and supplier.
 | [SBOM](https://scribe-security.netlify.app/docs/valint/sbom) |
| Require SBOM Existence | Verify the SBOM exists as evidence. | [SBOM](https://scribe-security.netlify.app/docs/valint/sbom) |
| Enforce Allowed SBOM Components | Verify the artifact contains only allowed components. | [SBOM](https://scribe-security.netlify.app/docs/valint/sbom) |
| Enforce SBOM License Completeness | Verify all dependencies in the artifact have a license. | [SBOM](https://scribe-security.netlify.app/docs/valint/sbom) |
| Require SBOM Signature | Verify the SBOM is signed. | [SBOM](https://scribe-security.netlify.app/docs/valint/sbom) |
| Apply Scribe Template Policy | Verify XX using the Scribe API template rule. | [SBOM](https://scribe-security.netlify.app/docs/valint/sbom) |
| Scribe Published Policy | Verify image Scribe Publish flag is set for container image. | [SBOM](https://scribe-security.netlify.app/docs/valint/sbom) |
| Require Image Labels | Verify the image has the specified labels. | [Image SBOM](https://scribe-security.netlify.app/docs/valint/sbom) |
| Disallow Container Shell Entrypoint | Verify the container image disallows shell entrypoint. | [Image SBOM](https://scribe-security.netlify.app/docs/valint/sbom) |
| Allowed Base Image | Verifies that every base image is from an approved source. The rule returns a summary
including the component names and versions of valid base images, or lists the invalid ones.
This rule requires Dockerfile context; for example, run it with:
`valint my_image --base-image Dockerfile`.
 | [Image SBOM](https://scribe-security.netlify.app/docs/valint/sbom) |
| Fresh Base Image | Verifies that each base image is not older than the specified threshold (max_days) from its creation date.
 | [Image SBOM](https://scribe-security.netlify.app/docs/valint/sbom) |
| Allowed Main Image Source | Ensures the main container image referenced in the SBOM is from an approved source.
 | [Image SBOM](https://scribe-security.netlify.app/docs/valint/sbom) |
| Registry Connection HTTPS | Checks if the container's registry scheme is HTTPS
 | [Image SBOM](https://scribe-security.netlify.app/docs/valint/sbom) |
| Fresh Image | Verify the image is not older than the specified threshold. | [Image SBOM](https://scribe-security.netlify.app/docs/valint/sbom) |
| Require Signed Container Image | Enforces that container images (target_type=container) are cryptographically signed.
 | [Image SBOM](https://scribe-security.netlify.app/docs/valint/sbom) |
| Forbid Large Images | Verify the image size is below the specified threshold. | [Image SBOM](https://scribe-security.netlify.app/docs/valint/sbom) |
| Restrict Build Scripts | Verify no build scripts commands appear in block list. | [Image SBOM](https://scribe-security.netlify.app/docs/valint/sbom) |
| Require Healthcheck | Checks that the container image includes at least one healthcheck property.
 | [Image SBOM](https://scribe-security.netlify.app/docs/valint/sbom) |
| Disallow Specific Users in SBOM | Verify specific users are not allowed in an SBOM. | [Image SBOM](https://scribe-security.netlify.app/docs/valint/sbom) |
| Verify Image Labels | Verify specified labels key-value pairs exist in the image. | [Image SBOM](https://scribe-security.netlify.app/docs/valint/sbom) |
| Banned Ports | Ensures that the container image does not expose ports that are disallowed by organizational policy.
The rule examines properties in the SBOM metadata and checks each value (expected in the format "port/protocol") against a provided banned ports list.
It fails if any banned port is exposed or if no banned ports list is provided.
 | [Image SBOM](https://scribe-security.netlify.app/docs/valint/sbom) |
| Verify File Integrity | Verify the checksum of each file in one SBOM matches the checksum in a second SBOM. | [Image SBOM](https://scribe-security.netlify.app/docs/valint/sbom) |
| Restrict Disallowed Dependencies | Verify the number of disallowed dependencies remains below the specified threshold. | [Image SBOM](https://scribe-security.netlify.app/docs/valint/sbom) |
| Verify No Critical or High Vulnerabilities | Verify via Scribe API that there no critical or high severity vulnerabilities in the target artifact (container image, folder, etc.). | [Image SBOM](https://scribe-security.netlify.app/docs/valint/sbom) |
| Disallow Unsigned Commits | Verify all commits are signed. | [Git SBOM](https://scribe-security.netlify.app/docs/valint/sbom) |
| Required Git Evidence Exists | Verify required Git evidence exists. | [Git SBOM](https://scribe-security.netlify.app/docs/valint/sbom) |
| Disallow Commits to Main Branch | Verify commits made directly to the main branch are disallowed. | [Git SBOM](https://scribe-security.netlify.app/docs/valint/sbom) |
| Restrict Coding Permissions | Verify only allowed users committed to the repository. | [Git SBOM](https://scribe-security.netlify.app/docs/valint/sbom) |
| Git Artifact Signed | Verify the Git artifact is signed. | [Git SBOM](https://scribe-security.netlify.app/docs/valint/sbom) |
| Verify Attack Vector Exists in SARIF | Verify required evidence validates attack vectors in the SARIF report. | [SARIF Evidence](https://scribe-security.netlify.app/docs/valint/sarif) |
| Verify Rule Compliance in SARIF | Verify the SARIF report complies with defined generic rules for compliance and security. | [SARIF Evidence](https://scribe-security.netlify.app/docs/valint/sarif) |
| Verify Required Evidence in SARIF | Verify all required evidence exists as defined by the SARIF policy. | [SARIF Evidence](https://scribe-security.netlify.app/docs/valint/sarif) |
| Verify Semgrep Rule in SARIF | Verify the Semgrep SARIF report complies with predefined rules to ensure compliance and detect issues. | [SARIF Evidence](https://scribe-security.netlify.app/docs/valint/sarif) |
| Verify Tool Evidence in SARIF | Verify required tools were used to generate the SARIF report. | [SARIF Evidence](https://scribe-security.netlify.app/docs/valint/sarif) |
| Verify IaC Misconfiguration Threshold in SARIF | Verify the number of infrastructure-as-code (IaC) errors in the SARIF report remains below the specified threshold. | [SARIF Evidence](https://scribe-security.netlify.app/docs/valint/sarif) |
| Verify Artifact Signature Using SARIF Report | Verify the artifact referenced in the SARIF report is signed to confirm its integrity. | [SARIF Evidence](https://scribe-security.netlify.app/docs/valint/sarif) |
| SARIF Update Needed | Verify no security packages require updates. | [SARIF Evidence](https://scribe-security.netlify.app/docs/valint/sarif) |
| Trivy Blocklist CVE Check | Verify a CVE Blocklist against a SARIF report | [SARIF Evidence](https://scribe-security.netlify.app/docs/valint/sarif) |
| Verify IaC Misconfiguration Threshold in Trivy SARIF | Verify the number of infrastructure-as-code (IaC) errors in the Trivy SARIF report remains below the specified threshold. | [SARIF Evidence](https://scribe-security.netlify.app/docs/valint/sarif) |
| Trivy Vulnerability Findings Check | Verifies that vulnerability findings in the SARIF evidence from Trivy do not exceed
the defined severity threshold.
 | [SARIF Evidence](https://scribe-security.netlify.app/docs/valint/sarif) |
| Verify Trivy SARIF Report Compliance | Verify the Trivy SARIF report complies with predefined rules to ensure compliance and detect issues. | [SARIF Evidence](https://scribe-security.netlify.app/docs/valint/sarif) |
| Verify Attack Vector Threshold in Trivy SARIF | Verify no attack vector in the Trivy SARIF report exceeds the specified threshold. | [SARIF Evidence](https://scribe-security.netlify.app/docs/valint/sarif) |
| K8s Jailbreak | Verify no misconfigurations from the prohibited ids list in the Kuberentes scan is below specified threshold | [SARIF Evidence](https://scribe-security.netlify.app/docs/valint/sarif) |
| Required Generic Evidence Exists | Verify required evidence exists. | [Generic Statement](https://scribe-security.netlify.app/docs/valint/generic) |
| Required Trivy Evidence Exists | Verify required Trivy evidence exists | [Generic Statement](https://scribe-security.netlify.app/docs/valint/generic) |
| Generic Artifact Signed | Verify required evidence is signed. | [Generic Statement](https://scribe-security.netlify.app/docs/valint/generic) |
| Prevent Long-Lived Tokens | Verify Bitbucket API tokens expire before the maximum time to live. | [Bitbucket Project Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#bitbucket-discovery) |
| Prevent Credential Exposure | Verify access to the Bitbucket project is blocked if exposed credentials are detected. | [Bitbucket Project Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#bitbucket-discovery) |
| Allowed Project Users | Verify only users specified in the Allowed List have user access to the Bitbucket project. | [Bitbucket Project Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#bitbucket-discovery) |
| Allowed Project Admins | Verify only users specified in the Allowed List have admin privileges in the Bitbucket project. | [Bitbucket Project Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#bitbucket-discovery) |
| Verify Default Branch Protection Setting Is Configured | Verify the default branch protection is enabled in the Bitbucket repository. | [Bitbucket Repository Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#bitbucket-discovery) |
| Allowed Repository Users | Verify only users specified in the Allowed List have user access to the Bitbucket repository. | [Bitbucket Repository Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#bitbucket-discovery) |
| Allowed Repository Admins | Verify only users specified in the Allowed List have admin privileges in the Bitbucket repository. | [Bitbucket Repository Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#bitbucket-discovery) |
| Allowed Workspace Users | Verify only users specified in the Allowed List have user access to the Bitbucket workspace. | [Bitbucket Workspace Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#bitbucket-discovery) |
| Allowed Workspace Admins | Verify only users specified in the Allowed List have admin privileges in the Bitbucket workspace. | [Bitbucket Workspace Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#bitbucket-discovery) |
| Verify Exposed Credentials | Verify there are no exposed credentials. | [Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover) |
| GitLab pipeline verify labels exist | Verify the pipeline has all required label keys and values. | [Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover) |
| Verify GitLab Pipeline Labels | Verify the pipeline includes all required label keys and values. | [Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover) |
| Verify DockerHub Tokens are Active | Verify that all discovered Dockerhub tokens are set to Active in Dockerhub. | [Dockerhub Project Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#dockerhub-discovery) |
| Verify no unused Dockerhub | Verify that there are no unused Dockerhub. | [Dockerhub Project Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#dockerhub-discovery) |
| Verify Secret_Scanning_Validity_Checks Setting in Security_And_Analysis | Verify `secret_scanning_validity_checks` is configured in the GitHub organization. | [Github Organization Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) |
| Allowed GitHub Organization Users | Verify only users in the Allowed List have user access to the GitHub organization. | [Github Organization Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) |
| Verify Secret_Scanning_Push_Protection_Custom_Link_Enabled Setting | Verify `secret_scanning_push_protection_custom_link` is enabled in the GitHub organization. | [Github Organization Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) |
| Verify Secret_Scanning_Push_Protection Setting | Verify `secret_scanning_push_protection` is configured in the GitHub repository. | [Github Organization Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) |
| Verify members_can_create_repositories setting | Verify `members_can_create_repositories` is appropriately configured in the GitHub repository. | [Github Organization Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) |
| Limit Admin Number in GitHub Organization | Verify the maximum number of GitHub organization admins is restricted. | [Github Organization Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) |
| Verify GitHub Organization Requires Signoff on Web Commits | Verify contributors sign commits through the GitHub web interface. | [Github Organization Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) |
| Verify Secret_Scanning Setting in Security_And_Analysis | Verify `secret_scanning` is configured in the GitHub repository. | [Github Organization Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) |
| Verify Secret_Scanning_Validity_Checks_Enabled Setting | Verify `secret_scanning_validity_checks` is configured in the GitHub repository. | [Github Organization Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) |
| Verify two_factor_requirement_enabled setting | Verify `two_factor_requirement` is enabled in the GitHub organization. | [Github Organization Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) |
| Verify Repo Visibility Setting | Verify only repositories in the Allowed List are public in the GitHub organization. | [Github Organization Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) |
| Verify dependabot_alerts_enabled_for_new_repositories setting | Verify Dependabot alerts for new repositories are enabled in the GitHub organization. | [Github Organization Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) |
| Verify dependabot_security_updates_enabled_for_new_repositories setting | Verify Dependabot security updates for new repositories are configured in the GitHub organization. | [Github Organization Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) |
| Verify GitHub Organization Secrets Are Not Too Old | Verify secrets in the GitHub organization are not older than the specified threshold. | [Github Organization Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) |
| Verify dependency_graph_enabled_for_new_repositories setting | Verify `dependency_graph` is enabled for new repositories in the GitHub organization. | [Github Organization Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) |
| Verify Secret_Scanning_Push_Protection_Enabled_For_New_Repositories Setting | Verify `secret_scanning_push_protection` is enabled for new repositories in the GitHub organization. | [Github Organization Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) |
| Verify advanced security setting is enabled | Verify `advanced_security_enabled_for_new_repositories` is enabled for new repositories in the GitHub organization. | [Github Organization Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) |
| Verify members_can_create_private_repositories setting | Verify `members_can_create_private_repositories` is configured in the GitHub organization (supported only in GitHub Enterprise). | [Github Organization Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) |
| Allowed GitHub Organization Admins | Verify only users in the Allowed List have admin privileges in the GitHub organization. | [Github Organization Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) |
| Verify dependabot_security_updates setting in security_and_analysis | Verify Dependabot security updates are configured in the GitHub organization. | [Github Organization Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) |
| Verify secret_scanning_enabled_for_new_repositories setting | Verify `secret_scanning` is enabled for new repositories in the GitHub organization. | [Github Organization Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) |
| Verify Branch Verification Setting | Verify branch verification in the GitHub repository matches the value defined in the configuration file. | [Github Repository Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) |
| Verify Branch Protection Setting | Verify branch protection is configured in the GitHub repository. | [Github Repository Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) |
| Verify All Commits Are Signed in Repository | Verify all commits are signed in a repository attestation. | [Github Repository Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) |
| Verify Dependabot security updates setting | Verify Dependabot security updates are configured in the GitHub repository. | [Github Repository Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) |
| Verify Repository Is Private | Verify the GitHub repository is private. | [Github Repository Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) |
| Verify No Organization Secrets Exist in Repository | Verify no organization secrets exist in the GitHub repository. | [Github Repository Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) |
| Verify Repository Requires Commit Signoff | Verify contributors sign off on commits to the GitHub repository through the GitHub web interface. | [Github Repository Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) |
| Verify secret scanning. | Verify both `secret_scanning_validity_checks` and `security_and_analysis` are set in GitHub organization and all the repositories. | [Github Repository Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) |
| Verify No Old Secrets Exist in Repository | Verify secrets in the GitHub repository are not older than the specified threshold. | [Github Repository Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) |
| Allowed Public Repositories | Verify only GitHub repositories in the Allowed List are public. | [Github Repository Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) |
| Verify No Cache Usage Exists in Repository | Verify the GitHub repository has no cache usage. | [Github Repository Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) |
| Verify Push Protection Setting | Verify `secret_scanning_push_protection` is configured in the GitHub repository. | [Github Repository Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) |
| Verify Only Ephemeral Runners Exist in Repository | Verify self-hosted runners are disallowed in the GitHub repository. | [Github Repository Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) |
| Verify All Commits Are Signed in Repository | Verify all commits in the GitHub repository are signed. | [Github Repository Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) |
| Verify Default Branch Protection | Verify the default branch protection is configured in the GitHub repository. | [Github Repository Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) |
| Verify secret_scanning setting | Verify `secret_scanning` is configured in the GitHub repository. | [Github Repository Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) |
| Ensure Active Projects in GitLab Organization | Verify no GitLab organization projects are inactive. | [Gitlab Organization Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) |
| Allowed Users in GitLab Organization | Verify only users in the Allowed List have access to the GitLab organization. | [Gitlab Organization Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) |
| Limit Admins in GitLab Organization | Verify the maximum number of admins for the GitLab project is restricted. | [Gitlab Organization Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) |
| Forbid Unused Tokens in GitLab Organization | Verify there are no unused GitLab organization tokens. | [Gitlab Organization Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) |
| Forbid Token Scopes in GitLab Organization | Verify no GitLab organization tokens have disallowed scopes. | [Gitlab Organization Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) |
| Prevent Token Expiration in GitLab Organization | Verify no GitLab organization tokens are about to expire. | [Gitlab Organization Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) |
| Allowed Admins in GitLab Organization | Verify only users in the Allowed List have admin privileges in the GitLab organization. | [Gitlab Organization Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) |
| Restrict Token Scopes in GitLab | Verify all tokens in the GitLab organization are restricted to allowed scopes to prevent excessive permission. | [Gitlab Organization Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) |
| Forbid Long-Lived Tokens in GitLab Organization | Verify no GitLab organization tokens have an excessively long lifespan. | [Gitlab Organization Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) |
| Block Users in GitLab Organization | Verify no users in the GitLab organization are on the block list. | [Gitlab Organization Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) |
| Restrict Public Visibility in GitLab Organization | Verify only allowed projects in the GitLab organization have public visibility. | [Gitlab Organization Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) |
| Reject Unsigned Commits in GitLab Project | Verify `reject_unsigned_commits` is enabled for the GitLab project. | [Gitlab Project Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) |
| Enforce Merge Access Level Policy for GitLab Project | Verify the GitLab project's merge access level complies with requirements. | [Gitlab Project Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) |
| Set Push Access Level in GitLab Project | Verify the GitLab project's push access level policy complies with requirements. | [Gitlab Project Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) |
| Ensure SAST Scanning Passes | Verify SAST scanning is successful for the GitLab project. | [Gitlab Project Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) |
| Check CWE Compliance | Verify that specified CWEs were not detected in the GitLab project. | [Gitlab Project Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) |
| Enable Commit Committer Check in GitLab Project | Verify `commit_committer_check` is enabled for the GitLab project. | [Gitlab Project Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) |
| Reset Approvals on Push in GitLab Project | Verify `reset_approvals_on_push` is set for the GitLab project. | [Gitlab Project Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) |
| Require Code Owner Approval in GitLab Project | Verify code owner approval is required for specific branches in the GitLab project. | [Gitlab Project Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) |
| Disallow Force Push in GitLab Project | Verify force pushes in the GitLab project are disallowed to maintain repository integrity. | [Gitlab Project Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) |
| Ensure Secrets Scanning Passes | Verify secrets scanning is successful for the GitLab project. | [Gitlab Project Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) |
| Protect CI Secrets in GitLab Project | Verify secrets in the GitLab project are not shared. | [Gitlab Project Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) |
| Enable Member Check for GitLab Project | Verify `member_check` is enabled for the GitLab project. | [Gitlab Project Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) |
| Check Description Substring | Verify a specific substring is not found in the description attribute of vulnerabilities for the GitLab project. | [Gitlab Project Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) |
| Set Author Email Regex in GitLab Project | Verify the `author_email_regex` for the GitLab project is set to the specified value. | [Gitlab Project Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) |
| Restrict Approvers Per Merge Request | Verify the binary field `disable_overriding_approvers_per_merge_request` is set for the GitLab project. | [Gitlab Project Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) |
| Merge approval policy check for GitLab project | Verify the project's merge approval policy complies with requirements. | [Gitlab Project Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) |
| Require Password for Approvals in GitLab Project | Verify the binary field `require_password_to_approve` is set for the GitLab project. | [Gitlab Project Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) |
| Verify Project Activity | Verify the GitLab project is active for a specified duration. | [Gitlab Project Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) |
| Disable Committers' Approval for Merge Requests in GitLab | Verify `merge_requests_disable_committers_approval` is set for the GitLab project. | [Gitlab Project Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) |
| Set Visibility Level in GitLab Project | Verify the GitLab project's visibility matches the required level. | [Gitlab Project Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) |
| Restrict Commit Authors in GitLab Project | Verify only GitLab project users in the Allowed List have commit author permissions. | [Gitlab Project Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) |
| Verify Commit Message Format | Verify that commit messages in the GitLab project adhere to the specified format template. | [Gitlab Project Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) |
| Validate All Commits in GitLab Project | Verify all commits in the GitLab project are validated. | [Gitlab Project Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) |
| Enforce Critical Severity Limit | Verify the maximum allowed critical severity alerts for the GitLab project. | [Gitlab Project Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) |
| Enable Secrets Prevention in GitLab Project | Verify `prevent_secrets` is enabled for the GitLab project. | [Gitlab Project Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) |
| Restrict Selective Code Owner Removals in GitLab | Verify `selective_code_owner_removals` is set for the GitLab project. | [Gitlab Project Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) |
| Disable Author Approval for Merge Requests in GitLab | Verify the binary field `merge_requests_author_approval` is set for the GitLab project. | [Gitlab Project Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) |
| Require Minimal Approvers in GitLab Project | Verify the required number of approvers for the GitLab project is met. | [Gitlab Project Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) |
| Run Secrets Scanning in GitLab Project | Verify secrets scanning is performed for the GitLab project. | [Gitlab Project Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) |
| Allowed Committer Emails in GitLab Project | Verify only users in the Allowed List use committer email addresses in the GitLab project. | [Gitlab Project Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) |
| Enforce Medium Severity Limit | Verify the maximum allowed medium severity alerts for the GitLab project. | [Gitlab Project Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) |
| Ensure All Commits Are Signed in GitLab Project | Verify all commits in the GitLab project are signed. | [Gitlab Project Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) |
| Disallow Banned Approvers | Verify approvers in the GitLab project are not on the banned list. | [Gitlab Project Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) |
| Check Message Substring | Verify a specific substring is not found in the message attribute of vulnerabilities for the GitLab project. | [Gitlab Project Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) |
| Allowed Committer Names in GitLab Project | Verify only users in the Allowed List commit by name in the GitLab project. | [Gitlab Project Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) |
| Allowed Commit Authors in GitLab Project | Verify only users in the Allowed List author commits in the GitLab project. | [Gitlab Project Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) |
| Set Push Rules for GitLab Project | Verify push rules are set for the GitLab project. | [Gitlab Project Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) |
| Run SAST Scanning in GitLab Project | Verify SAST scanning is performed for the GitLab project. | [Gitlab Project Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) |
| Disallow Unused Users | Verify there are no users with zero activity. | [Jenkins Instance Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#jenkins-discovery) |
| Verify Inactive Users | Verify there are no inactive users. | [Jenkins Instance Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#jenkins-discovery) |
| Allowed Namespace Registries | Verify container images in Kubernetes namespaces originate from registries in the Allowed List. | [K8s Namespace Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#k8s-discovery) |
| Allowed Namespaces | Verify only namespaces specified in the Allowed List are allowed within the cluster. | [K8s Namespace Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#k8s-discovery) |
| Verify Namespace Runtime Duration | Verify Kubernetes namespaces adhere to a specified runtime duration to enforce lifecycle limits. | [K8s Namespace Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#k8s-discovery) |
| Verify Namespace Termination | Verify Kubernetes namespaces are properly terminated to prevent lingering resources and maintain cluster hygiene. | [K8s Namespace Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#k8s-discovery) |
| Allowed Container Images | Verify only container images specified in the Allowed List run within the Kubernetes namespace. | [K8s Namespace Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#k8s-discovery) |
| Allowed Pods in Namespace | Verify only pods explicitly listed in the Allowed List run within a Kubernetes namespace. | [K8s Namespace Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#k8s-discovery) |
| Verify Pod Termination | Verify Kubernetes pods are properly terminated to prevent lingering resources and maintain cluster hygiene. | [K8s Pod Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#k8s-discovery) |
| Verify Pod Runtime Duration | Verify Kubernetes pods adhere to a specified runtime duration to enforce lifecycle limits. | [K8s Pod Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#k8s-discovery) |
| Allowed Pods | Verify only pods explicitly listed in the Allowed List are allowed to run. | [K8s Pod Discovery Evidence](https://scribe-security.netlify.app/docs/platforms/discover#k8s-discovery) |
| Verify that provenance is authenticated | Verify the artifact is signed. | [SLSA Provenance](https://scribe-security.netlify.app/docs/valint/help/valint_slsa) |
| Verify that artifact was created by the specified builder | Verify the artifact was created by the specified builder. | [SLSA Provenance](https://scribe-security.netlify.app/docs/valint/help/valint_slsa) |
| Disallow dependencies in SLSA Provenance Document | Verify that dependencies in the block list do not appear in the SLSA Proveance document. | [SLSA Provenance](https://scribe-security.netlify.app/docs/valint/help/valint_slsa) |
| SLSA Field Exists in Provenance Document | Verify the specified field exists in the provenance document. | [SLSA Provenance](https://scribe-security.netlify.app/docs/valint/help/valint_slsa) |
| Verify that artifact has no disallowed builder dependencies | Verify the artifact has no disallowed builder dependencies. | [SLSA Provenance](https://scribe-security.netlify.app/docs/valint/help/valint_slsa) |
| Verify build time | Verify the artifact was created within the specified time window. | [SLSA Provenance](https://scribe-security.netlify.app/docs/valint/help/valint_slsa) |
| Verify Provenance Document Exists | Verify that the Provenance document evidence exists. | [SLSA Provenance](https://scribe-security.netlify.app/docs/valint/help/valint_slsa) |
| Sign Selected Commit Range in GitLab | Verify the selected range of commits is signed via the GitLab API. | [Statement](https://scribe-security.netlify.app/docs/valint/generic) |
| Sign Selected Commits in GitLab | Verify the selected commits are signed in the GitLab organization. | [Statement](https://scribe-security.netlify.app/docs/valint/generic) |
| Set Push Rules in GitLab | Verify GitLab push rules are configured via the API. | [Statement](https://scribe-security.netlify.app/docs/valint/generic) |
| Enforce 2FA | PS.1 Require 2FA for accessing code | [Statement](https://scribe-security.netlify.app/docs/valint/generic) |
| SBOM archived | PS.3.2 Archive SBOM | [Statement](https://scribe-security.netlify.app/docs/valint/generic) |
| Limit admins | PS.1 Restrict the maximum number of organization admins | [Statement](https://scribe-security.netlify.app/docs/valint/generic) |
| Branch protected | PS.1 Require branch protection for the repository | [Statement](https://scribe-security.netlify.app/docs/valint/generic) |
| Code archived | PS.3.1 Verify that the software release data is archived.
We assume running in Github thus the code is allways stored in a repository
 | [Statement](https://scribe-security.netlify.app/docs/valint/generic) |
| Require signoff on web commits | PS.1 Require contributors to sign when committing to Github through the web interface | [Statement](https://scribe-security.netlify.app/docs/valint/generic) |
| Repo private | PS.1 Assure the repository is private | [Statement](https://scribe-security.netlify.app/docs/valint/generic) |
| Image-verifiable | PS.2 Provide a mechanism to verify the integrity of the image | [Statement](https://scribe-security.netlify.app/docs/valint/generic) |
| Verify No Critical or High Vulnerabilities in Product | Verify via Scribe API that there no critical or high severity vulnerabilities in any deliverable component of the product. | [Statement](https://scribe-security.netlify.app/docs/valint/generic) |
| Disallow Unsigned Commits In Time Range | Verify commits in the specified time range are signed. | [Statement](https://scribe-security.netlify.app/docs/valint/generic) |
| Branch protection enabled in GitHub repository | Verify GitHub branch protection rules | [Statement](https://scribe-security.netlify.app/docs/valint/generic) |
| Verify Selected Commits Are Signed API | Verify selected commits are signed in the GitHub organization. | [Statement](https://scribe-security.netlify.app/docs/valint/generic) |