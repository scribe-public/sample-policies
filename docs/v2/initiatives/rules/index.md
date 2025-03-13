# Rule Index

| Rule Name | Description | Evidence Type |
|-----------|-------------|---------------|
| Restrict Disallowed SBOM Licenses | Verify the number of disallowed licenses in SBOM dependencies remains below the specified threshold. |  See [here](https://scribe-security.netlify.app/docs/valint/sbom) for more details. |
| Enforce SBOM Freshness | Verify the SBOM is not older than the specified duration. |  See [here](https://scribe-security.netlify.app/docs/valint/sbom) for more details. |
| Require Specified SBOM Licenses | Verify the artifact includes all specified licenses. |  See [here](https://scribe-security.netlify.app/docs/valint/sbom) for more details. |
| Enforce SBOM Dependencies | Verify the artifact includes all required dependencies specified as a list of PURLs. |  See [here](https://scribe-security.netlify.app/docs/valint/sbom) for more details. |
| NTIA SBOM Compliance Check | Validates that SBOM metadata meets basic NTIA requirements for authors and supplier.
 |  See [here](https://scribe-security.netlify.app/docs/valint/sbom) for more details. |
| Require SBOM Existence | Verify the SBOM exists as evidence. |  See [here](https://scribe-security.netlify.app/docs/valint/sbom) for more details. |
| Enforce Allowed SBOM Components | Verify the artifact contains only allowed components. |  See [here](https://scribe-security.netlify.app/docs/valint/sbom) for more details. |
| Enforce SBOM License Completeness | Verify all dependencies in the artifact have a license. |  See [here](https://scribe-security.netlify.app/docs/valint/sbom) for more details. |
| Require SBOM Signature | Verify the SBOM is signed. |  See [here](https://scribe-security.netlify.app/docs/valint/sbom) for more details. |
| Apply Scribe Template Policy | Verify XX using the Scribe API template rule. |  See [here](https://scribe-security.netlify.app/docs/valint/sbom) for more details. |
| Scribe Published Policy | Verify image Scribe Publish flag is set for container image. |  See [here](https://scribe-security.netlify.app/docs/valint/sbom) for more details. |
| Require Image Labels | Verify the image has the specified labels. |  See [here](https://scribe-security.netlify.app/docs/valint/sbom) for more details. |
| Disallow Container Shell Entrypoint | Verify the container image disallows shell entrypoint. |  See [here](https://scribe-security.netlify.app/docs/valint/sbom) for more details. |
| Allowed Base Image | Verifies that every base image is from an approved source. The rule returns a summary
including the component names and versions of valid base images, or lists the invalid ones.
This rule requires Dockerfile context; for example, run it with:
`valint my_image --base-image Dockerfile`.
 |  See [here](https://scribe-security.netlify.app/docs/valint/sbom) for more details. |
| Fresh Base Image | Verifies that each base image is not older than the specified threshold (max_days) from its creation date.
 |  See [here](https://scribe-security.netlify.app/docs/valint/sbom) for more details. |
| Allowed Main Image Source | Ensures the main container image referenced in the SBOM is from an approved source.
 |  See [here](https://scribe-security.netlify.app/docs/valint/sbom) for more details. |
| Registry Connection HTTPS | Checks if the container's registry scheme is HTTPS
 |  See [here](https://scribe-security.netlify.app/docs/valint/sbom) for more details. |
| Fresh Image | Verify the image is not older than the specified threshold. |  See [here](https://scribe-security.netlify.app/docs/valint/sbom) for more details. |
| Require Signed Container Image | Enforces that container images (target_type=container) are cryptographically signed.
 |  See [here](https://scribe-security.netlify.app/docs/valint/sbom) for more details. |
| Forbid Large Images | Verify the image size is below the specified threshold. |  See [here](https://scribe-security.netlify.app/docs/valint/sbom) for more details. |
| Restrict Build Scripts | Verify no build scripts commands appear in block list. |  See [here](https://scribe-security.netlify.app/docs/valint/sbom) for more details. |
| Require Healthcheck | Checks that the container image includes at least one healthcheck property.
 |  See [here](https://scribe-security.netlify.app/docs/valint/sbom) for more details. |
| Disallow Specific Users in SBOM | Verify specific users are not allowed in an SBOM. |  See [here](https://scribe-security.netlify.app/docs/valint/sbom) for more details. |
| Verify Image Labels | Verify specified labels key-value pairs exist in the image. |  See [here](https://scribe-security.netlify.app/docs/valint/sbom) for more details. |
| Banned Ports | Ensures that the container image does not expose ports that are disallowed by organizational policy.
The rule examines properties in the SBOM metadata and checks each value (expected in the format "port/protocol") against a provided banned ports list.
It fails if any banned port is exposed or if no banned ports list is provided.
 |  See [here](https://scribe-security.netlify.app/docs/valint/sbom) for more details. |
| Verify File Integrity | Verify the checksum of each file in one SBOM matches the checksum in a second SBOM. |  See [here](https://scribe-security.netlify.app/docs/valint/sbom) for more details. |
| Restrict Disallowed Dependencies | Verify the number of disallowed dependencies remains below the specified threshold. |  See [here](https://scribe-security.netlify.app/docs/valint/sbom) for more details. |
| Verify No Critical or High Vulnerabilities | Verify via Scribe API that there no critical or high severity vulnerabilities in the target artifact (container image, folder, etc.). |  See [here](https://scribe-security.netlify.app/docs/valint/sbom) for more details. |
| Disallow Unsigned Commits | Verify all commits are signed. |  See [here](https://scribe-security.netlify.app/docs/valint/sbom) for more details. |
| Required Git Evidence Exists | Verify required Git evidence exists. |  See [here](https://scribe-security.netlify.app/docs/valint/sbom) for more details. |
| Disallow Commits to Main Branch | Verify commits made directly to the main branch are disallowed. |  See [here](https://scribe-security.netlify.app/docs/valint/sbom) for more details. |
| Restrict Coding Permissions | Verify only allowed users committed to the repository. |  See [here](https://scribe-security.netlify.app/docs/valint/sbom) for more details. |
| Git Artifact Signed | Verify the Git artifact is signed. |  See [here](https://scribe-security.netlify.app/docs/valint/sbom) for more details. |
| Verify Attack Vector Exists in SARIF | Verify required evidence validates attack vectors in the SARIF report. |  See [here](https://scribe-security.netlify.app/docs/valint/sarif) for more details. |
| Verify Rule Compliance in SARIF | Verify the SARIF report complies with defined generic rules for compliance and security. |  See [here](https://scribe-security.netlify.app/docs/valint/sarif) for more details. |
| Verify Required Evidence in SARIF | Verify all required evidence exists as defined by the SARIF policy. |  See [here](https://scribe-security.netlify.app/docs/valint/sarif) for more details. |
| Verify Semgrep Rule in SARIF | Verify the Semgrep SARIF report complies with predefined rules to ensure compliance and detect issues. |  See [here](https://scribe-security.netlify.app/docs/valint/sarif) for more details. |
| Verify Tool Evidence in SARIF | Verify required tools were used to generate the SARIF report. |  See [here](https://scribe-security.netlify.app/docs/valint/sarif) for more details. |
| Verify IaC Misconfiguration Threshold in SARIF | Verify the number of infrastructure-as-code (IaC) errors in the SARIF report remains below the specified threshold. |  See [here](https://scribe-security.netlify.app/docs/valint/sarif) for more details. |
| Verify Artifact Signature Using SARIF Report | Verify the artifact referenced in the SARIF report is signed to confirm its integrity. |  See [here](https://scribe-security.netlify.app/docs/valint/sarif) for more details. |
| SARIF Update Needed | Verify no security packages require updates. |  See [here](https://scribe-security.netlify.app/docs/valint/sarif) for more details. |
| Trivy Blocklist CVE Check | Verify a CVE Blocklist against a SARIF report |  See [here](https://scribe-security.netlify.app/docs/valint/sarif) for more details. |
| Verify IaC Misconfiguration Threshold in Trivy SARIF | Verify the number of infrastructure-as-code (IaC) errors in the Trivy SARIF report remains below the specified threshold. |  See [here](https://scribe-security.netlify.app/docs/valint/sarif) for more details. |
| Trivy Vulnerability Findings Check | Verifies that vulnerability findings in the SARIF evidence from Trivy do not exceed
the defined severity threshold.
 |  See [here](https://scribe-security.netlify.app/docs/valint/sarif) for more details. |
| Verify Trivy SARIF Report Compliance | Verify the Trivy SARIF report complies with predefined rules to ensure compliance and detect issues. |  See [here](https://scribe-security.netlify.app/docs/valint/sarif) for more details. |
| Verify Attack Vector Threshold in Trivy SARIF | Verify no attack vector in the Trivy SARIF report exceeds the specified threshold. |  See [here](https://scribe-security.netlify.app/docs/valint/sarif) for more details. |
| K8s Jailbreak | Verify no misconfigurations from the prohibited ids list in the Kuberentes scan is below specified threshold |  See [here](https://scribe-security.netlify.app/docs/valint/sarif) for more details. |
| Required Generic Evidence Exists | Verify required evidence exists. |  See [here](https://scribe-security.netlify.app/docs/valint/generic) for more details. |
| Required Trivy Evidence Exists | Verify required Trivy evidence exists |  See [here](https://scribe-security.netlify.app/docs/valint/generic) for more details. |
| Generic Artifact Signed | Verify required evidence is signed. |  See [here](https://scribe-security.netlify.app/docs/valint/generic) for more details. |
| Prevent Long-Lived Tokens | Verify Bitbucket API tokens expire before the maximum time to live. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#bitbucket-discovery) for more details. |
| Prevent Credential Exposure | Verify access to the Bitbucket project is blocked if exposed credentials are detected. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#bitbucket-discovery) for more details. |
| Allowed Project Users | Verify only users specified in the Allowed List have user access to the Bitbucket project. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#bitbucket-discovery) for more details. |
| Allowed Project Admins | Verify only users specified in the Allowed List have admin privileges in the Bitbucket project. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#bitbucket-discovery) for more details. |
| Verify Default Branch Protection Setting Is Configured | Verify the default branch protection is enabled in the Bitbucket repository. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#bitbucket-discovery) for more details. |
| Allowed Repository Users | Verify only users specified in the Allowed List have user access to the Bitbucket repository. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#bitbucket-discovery) for more details. |
| Allowed Repository Admins | Verify only users specified in the Allowed List have admin privileges in the Bitbucket repository. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#bitbucket-discovery) for more details. |
| Allowed Workspace Users | Verify only users specified in the Allowed List have user access to the Bitbucket workspace. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#bitbucket-discovery) for more details. |
| Allowed Workspace Admins | Verify only users specified in the Allowed List have admin privileges in the Bitbucket workspace. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#bitbucket-discovery) for more details. |
| Verify Exposed Credentials | Verify there are no exposed credentials. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover) for more details. |
| GitLab pipeline verify labels exist | Verify the pipeline has all required label keys and values. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover) for more details. |
| Verify GitLab Pipeline Labels | Verify the pipeline includes all required label keys and values. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover) for more details. |
| Verify DockerHub Tokens are Active | Verify that all discovered Dockerhub tokens are set to Active in Dockerhub. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#dockerhub-discovery) for more details. |
| Verify no unused Dockerhub | Verify that there are no unused Dockerhub. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#dockerhub-discovery) for more details. |
| Verify Secret_Scanning_Validity_Checks Setting in Security_And_Analysis | Verify `secret_scanning_validity_checks` is configured in the GitHub organization. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) for more details. |
| Allowed GitHub Organization Users | Verify only users in the Allowed List have user access to the GitHub organization. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) for more details. |
| Verify Secret_Scanning_Push_Protection_Custom_Link_Enabled Setting | Verify `secret_scanning_push_protection_custom_link` is enabled in the GitHub organization. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) for more details. |
| Verify Secret_Scanning_Push_Protection Setting | Verify `secret_scanning_push_protection` is configured in the GitHub repository. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) for more details. |
| Verify members_can_create_repositories setting | Verify `members_can_create_repositories` is appropriately configured in the GitHub repository. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) for more details. |
| Limit Admin Number in GitHub Organization | Verify the maximum number of GitHub organization admins is restricted. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) for more details. |
| Verify GitHub Organization Requires Signoff on Web Commits | Verify contributors sign commits through the GitHub web interface. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) for more details. |
| Verify Secret_Scanning Setting in Security_And_Analysis | Verify `secret_scanning` is configured in the GitHub repository. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) for more details. |
| Verify Secret_Scanning_Validity_Checks_Enabled Setting | Verify `secret_scanning_validity_checks` is configured in the GitHub repository. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) for more details. |
| Verify two_factor_requirement_enabled setting | Verify `two_factor_requirement` is enabled in the GitHub organization. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) for more details. |
| Verify Repo Visibility Setting | Verify only repositories in the Allowed List are public in the GitHub organization. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) for more details. |
| Verify dependabot_alerts_enabled_for_new_repositories setting | Verify Dependabot alerts for new repositories are enabled in the GitHub organization. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) for more details. |
| Verify dependabot_security_updates_enabled_for_new_repositories setting | Verify Dependabot security updates for new repositories are configured in the GitHub organization. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) for more details. |
| Verify GitHub Organization Secrets Are Not Too Old | Verify secrets in the GitHub organization are not older than the specified threshold. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) for more details. |
| Verify dependency_graph_enabled_for_new_repositories setting | Verify `dependency_graph` is enabled for new repositories in the GitHub organization. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) for more details. |
| Verify Secret_Scanning_Push_Protection_Enabled_For_New_Repositories Setting | Verify `secret_scanning_push_protection` is enabled for new repositories in the GitHub organization. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) for more details. |
| Verify advanced security setting is enabled | Verify `advanced_security_enabled_for_new_repositories` is enabled for new repositories in the GitHub organization. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) for more details. |
| Verify members_can_create_private_repositories setting | Verify `members_can_create_private_repositories` is configured in the GitHub organization (supported only in GitHub Enterprise). |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) for more details. |
| Allowed GitHub Organization Admins | Verify only users in the Allowed List have admin privileges in the GitHub organization. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) for more details. |
| Verify dependabot_security_updates setting in security_and_analysis | Verify Dependabot security updates are configured in the GitHub organization. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) for more details. |
| Verify secret_scanning_enabled_for_new_repositories setting | Verify `secret_scanning` is enabled for new repositories in the GitHub organization. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) for more details. |
| Verify Branch Verification Setting | Verify branch verification in the GitHub repository matches the value defined in the configuration file. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) for more details. |
| Verify Branch Protection Setting | Verify branch protection is configured in the GitHub repository. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) for more details. |
| Verify All Commits Are Signed in Repository | Verify all commits are signed in a repository attestation. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) for more details. |
| Verify Dependabot security updates setting | Verify Dependabot security updates are configured in the GitHub repository. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) for more details. |
| Verify Repository Is Private | Verify the GitHub repository is private. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) for more details. |
| Verify No Organization Secrets Exist in Repository | Verify no organization secrets exist in the GitHub repository. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) for more details. |
| Verify Repository Requires Commit Signoff | Verify contributors sign off on commits to the GitHub repository through the GitHub web interface. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) for more details. |
| Verify secret scanning. | Verify both `secret_scanning_validity_checks` and `security_and_analysis` are set in GitHub organization and all the repositories. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) for more details. |
| Verify No Old Secrets Exist in Repository | Verify secrets in the GitHub repository are not older than the specified threshold. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) for more details. |
| Allowed Public Repositories | Verify only GitHub repositories in the Allowed List are public. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) for more details. |
| Verify No Cache Usage Exists in Repository | Verify the GitHub repository has no cache usage. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) for more details. |
| Verify Push Protection Setting | Verify `secret_scanning_push_protection` is configured in the GitHub repository. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) for more details. |
| Verify Only Ephemeral Runners Exist in Repository | Verify self-hosted runners are disallowed in the GitHub repository. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) for more details. |
| Verify All Commits Are Signed in Repository | Verify all commits in the GitHub repository are signed. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) for more details. |
| Verify Default Branch Protection | Verify the default branch protection is configured in the GitHub repository. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) for more details. |
| Verify secret_scanning setting | Verify `secret_scanning` is configured in the GitHub repository. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#github-discovery) for more details. |
| Ensure Active Projects in GitLab Organization | Verify no GitLab organization projects are inactive. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) for more details. |
| Allowed Users in GitLab Organization | Verify only users in the Allowed List have access to the GitLab organization. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) for more details. |
| Limit Admins in GitLab Organization | Verify the maximum number of admins for the GitLab project is restricted. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) for more details. |
| Forbid Unused Tokens in GitLab Organization | Verify there are no unused GitLab organization tokens. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) for more details. |
| Forbid Token Scopes in GitLab Organization | Verify no GitLab organization tokens have disallowed scopes. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) for more details. |
| Prevent Token Expiration in GitLab Organization | Verify no GitLab organization tokens are about to expire. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) for more details. |
| Allowed Admins in GitLab Organization | Verify only users in the Allowed List have admin privileges in the GitLab organization. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) for more details. |
| Restrict Token Scopes in GitLab | Verify all tokens in the GitLab organization are restricted to allowed scopes to prevent excessive permission. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) for more details. |
| Forbid Long-Lived Tokens in GitLab Organization | Verify no GitLab organization tokens have an excessively long lifespan. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) for more details. |
| Block Users in GitLab Organization | Verify no users in the GitLab organization are on the block list. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) for more details. |
| Restrict Public Visibility in GitLab Organization | Verify only allowed projects in the GitLab organization have public visibility. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) for more details. |
| Reject Unsigned Commits in GitLab Project | Verify `reject_unsigned_commits` is enabled for the GitLab project. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) for more details. |
| Enforce Merge Access Level Policy for GitLab Project | Verify the GitLab project's merge access level complies with requirements. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) for more details. |
| Set Push Access Level in GitLab Project | Verify the GitLab project's push access level policy complies with requirements. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) for more details. |
| Ensure SAST Scanning Passes | Verify SAST scanning is successful for the GitLab project. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) for more details. |
| Check CWE Compliance | Verify that specified CWEs were not detected in the GitLab project. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) for more details. |
| Enable Commit Committer Check in GitLab Project | Verify `commit_committer_check` is enabled for the GitLab project. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) for more details. |
| Reset Approvals on Push in GitLab Project | Verify `reset_approvals_on_push` is set for the GitLab project. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) for more details. |
| Require Code Owner Approval in GitLab Project | Verify code owner approval is required for specific branches in the GitLab project. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) for more details. |
| Disallow Force Push in GitLab Project | Verify force pushes in the GitLab project are disallowed to maintain repository integrity. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) for more details. |
| Ensure Secrets Scanning Passes | Verify secrets scanning is successful for the GitLab project. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) for more details. |
| Protect CI Secrets in GitLab Project | Verify secrets in the GitLab project are not shared. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) for more details. |
| Enable Member Check for GitLab Project | Verify `member_check` is enabled for the GitLab project. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) for more details. |
| Check Description Substring | Verify a specific substring is not found in the description attribute of vulnerabilities for the GitLab project. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) for more details. |
| Set Author Email Regex in GitLab Project | Verify the `author_email_regex` for the GitLab project is set to the specified value. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) for more details. |
| Restrict Approvers Per Merge Request | Verify the binary field `disable_overriding_approvers_per_merge_request` is set for the GitLab project. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) for more details. |
| Merge approval policy check for GitLab project | Verify the project's merge approval policy complies with requirements. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) for more details. |
| Require Password for Approvals in GitLab Project | Verify the binary field `require_password_to_approve` is set for the GitLab project. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) for more details. |
| Verify Project Activity | Verify the GitLab project is active for a specified duration. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) for more details. |
| Disable Committers' Approval for Merge Requests in GitLab | Verify `merge_requests_disable_committers_approval` is set for the GitLab project. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) for more details. |
| Set Visibility Level in GitLab Project | Verify the GitLab project's visibility matches the required level. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) for more details. |
| Restrict Commit Authors in GitLab Project | Verify only GitLab project users in the Allowed List have commit author permissions. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) for more details. |
| Verify Commit Message Format | Verify that commit messages in the GitLab project adhere to the specified format template. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) for more details. |
| Validate All Commits in GitLab Project | Verify all commits in the GitLab project are validated. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) for more details. |
| Enforce Critical Severity Limit | Verify the maximum allowed critical severity alerts for the GitLab project. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) for more details. |
| Enable Secrets Prevention in GitLab Project | Verify `prevent_secrets` is enabled for the GitLab project. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) for more details. |
| Restrict Selective Code Owner Removals in GitLab | Verify `selective_code_owner_removals` is set for the GitLab project. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) for more details. |
| Disable Author Approval for Merge Requests in GitLab | Verify the binary field `merge_requests_author_approval` is set for the GitLab project. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) for more details. |
| Require Minimal Approvers in GitLab Project | Verify the required number of approvers for the GitLab project is met. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) for more details. |
| Run Secrets Scanning in GitLab Project | Verify secrets scanning is performed for the GitLab project. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) for more details. |
| Allowed Committer Emails in GitLab Project | Verify only users in the Allowed List use committer email addresses in the GitLab project. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) for more details. |
| Enforce Medium Severity Limit | Verify the maximum allowed medium severity alerts for the GitLab project. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) for more details. |
| Ensure All Commits Are Signed in GitLab Project | Verify all commits in the GitLab project are signed. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) for more details. |
| Disallow Banned Approvers | Verify approvers in the GitLab project are not on the banned list. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) for more details. |
| Check Message Substring | Verify a specific substring is not found in the message attribute of vulnerabilities for the GitLab project. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) for more details. |
| Allowed Committer Names in GitLab Project | Verify only users in the Allowed List commit by name in the GitLab project. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) for more details. |
| Allowed Commit Authors in GitLab Project | Verify only users in the Allowed List author commits in the GitLab project. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) for more details. |
| Set Push Rules for GitLab Project | Verify push rules are set for the GitLab project. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) for more details. |
| Run SAST Scanning in GitLab Project | Verify SAST scanning is performed for the GitLab project. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#gitlab-discovery) for more details. |
| Disallow Unused Users | Verify there are no users with zero activity. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#jenkins-discovery) for more details. |
| Verify Inactive Users | Verify there are no inactive users. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#jenkins-discovery) for more details. |
| Allowed Namespace Registries | Verify container images in Kubernetes namespaces originate from registries in the Allowed List. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#k8s-discovery) for more details. |
| Allowed Namespaces | Verify only namespaces specified in the Allowed List are allowed within the cluster. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#k8s-discovery) for more details. |
| Verify Namespace Runtime Duration | Verify Kubernetes namespaces adhere to a specified runtime duration to enforce lifecycle limits. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#k8s-discovery) for more details. |
| Verify Namespace Termination | Verify Kubernetes namespaces are properly terminated to prevent lingering resources and maintain cluster hygiene. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#k8s-discovery) for more details. |
| Allowed Container Images | Verify only container images specified in the Allowed List run within the Kubernetes namespace. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#k8s-discovery) for more details. |
| Allowed Pods in Namespace | Verify only pods explicitly listed in the Allowed List run within a Kubernetes namespace. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#k8s-discovery) for more details. |
| Verify Pod Termination | Verify Kubernetes pods are properly terminated to prevent lingering resources and maintain cluster hygiene. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#k8s-discovery) for more details. |
| Verify Pod Runtime Duration | Verify Kubernetes pods adhere to a specified runtime duration to enforce lifecycle limits. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#k8s-discovery) for more details. |
| Allowed Pods | Verify only pods explicitly listed in the Allowed List are allowed to run. |  See [here](https://scribe-security.netlify.app/docs/platforms/discover#k8s-discovery) for more details. |
| Verify that provenance is authenticated | Verify the artifact is signed. |  See [here](https://scribe-security.netlify.app/docs/valint/help/valint_slsa) for more details. |
| Verify that artifact was created by the specified builder | Verify the artifact was created by the specified builder. |  See [here](https://scribe-security.netlify.app/docs/valint/help/valint_slsa) for more details. |
| Disallow dependencies in SLSA Provenance Document | Verify that dependencies in the block list do not appear in the SLSA Proveance document. |  See [here](https://scribe-security.netlify.app/docs/valint/help/valint_slsa) for more details. |
| SLSA Field Exists in Provenance Document | Verify the specified field exists in the provenance document. |  See [here](https://scribe-security.netlify.app/docs/valint/help/valint_slsa) for more details. |
| Verify that artifact has no disallowed builder dependencies | Verify the artifact has no disallowed builder dependencies. |  See [here](https://scribe-security.netlify.app/docs/valint/help/valint_slsa) for more details. |
| Verify build time | Verify the artifact was created within the specified time window. |  See [here](https://scribe-security.netlify.app/docs/valint/help/valint_slsa) for more details. |
| Verify Provenance Document Exists | Verify that the Provenance document evidence exists. |  See [here](https://scribe-security.netlify.app/docs/valint/help/valint_slsa) for more details. |
| Sign Selected Commit Range in GitLab | Verify the selected range of commits is signed via the GitLab API. |  See [here](https://scribe-security.netlify.app/docs/valint/generic) for more details. |
| Sign Selected Commits in GitLab | Verify the selected commits are signed in the GitLab organization. |  See [here](https://scribe-security.netlify.app/docs/valint/generic) for more details. |
| Set Push Rules in GitLab | Verify GitLab push rules are configured via the API. |  See [here](https://scribe-security.netlify.app/docs/valint/generic) for more details. |
| Enforce 2FA | PS.1 Require 2FA for accessing code |  See [here](https://scribe-security.netlify.app/docs/valint/generic) for more details. |
| SBOM archived | PS.3.2 Archive SBOM |  See [here](https://scribe-security.netlify.app/docs/valint/generic) for more details. |
| Limit admins | PS.1 Restrict the maximum number of organization admins |  See [here](https://scribe-security.netlify.app/docs/valint/generic) for more details. |
| Branch protected | PS.1 Require branch protection for the repository |  See [here](https://scribe-security.netlify.app/docs/valint/generic) for more details. |
| Code archived | PS.3.1 Verify that the software release data is archived.
We assume running in Github thus the code is allways stored in a repository
 |  See [here](https://scribe-security.netlify.app/docs/valint/generic) for more details. |
| Require signoff on web commits | PS.1 Require contributors to sign when committing to Github through the web interface |  See [here](https://scribe-security.netlify.app/docs/valint/generic) for more details. |
| Repo private | PS.1 Assure the repository is private |  See [here](https://scribe-security.netlify.app/docs/valint/generic) for more details. |
| Image-verifiable | PS.2 Provide a mechanism to verify the integrity of the image |  See [here](https://scribe-security.netlify.app/docs/valint/generic) for more details. |
| Verify No Critical or High Vulnerabilities in Product | Verify via Scribe API that there no critical or high severity vulnerabilities in any deliverable component of the product. |  See [here](https://scribe-security.netlify.app/docs/valint/generic) for more details. |
| Disallow Unsigned Commits In Time Range | Verify commits in the specified time range are signed. |  See [here](https://scribe-security.netlify.app/docs/valint/generic) for more details. |
| Branch protection enabled in GitHub repository | Verify GitHub branch protection rules |  See [here](https://scribe-security.netlify.app/docs/valint/generic) for more details. |
| Verify Selected Commits Are Signed API | Verify selected commits are signed in the GitHub organization. |  See [here](https://scribe-security.netlify.app/docs/valint/generic) for more details. |