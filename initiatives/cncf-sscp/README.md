# CNCF Software Supply Chain Best Practices Initiative
## Background
The [CNCF software supply chain best practices](https://github.com/cncf/tag-security/blob/main/supply-chain-security/supply-chain-security-paper/CNCF_SSCP_v1.pdf).  is a set of best practices to protect the software supply chain. It is based on analysis of many attacks and is a result of a collaborative effort of many industry leaders. This set of best practices is composed of many security controls and practices, required to be done by different stakeholders, and contains the following controls categories:
* Verify source code
* Verify materials
* Protecting build pipelines
* Protecting artefacts and deployments

It is a very comprehensive set of best practices, and it is not expected that all of them will be adopted at once. It is expected that organizations will adopt them gradually, and this initiative set is a way to help organizations to adopt them gradually, and measure the progress of their adoption.

## Initiatives

### Verify source code category
This category consists of the following best practices:
* Verify signed commits
* Verify no Secrets in Source Code
* Verify acceptable level of vulnerabilities in source code
* Verify contributors roles
* Verify approval of new code
* Verify branch protection deployment
* Limit automated access to the source code to read-only
* Verify source code access requires MFA and Fresh SSH keys

We recommend to adopt these best practices gradually, by deploying the following initiatives:
* [access-control-level-1](access-control-level-1/README.md): These controls can be adopted first, as they address a prioritized attack-surface (access), are relatively easy to adopt, and provide a good level of security.
    * Verify branch protection deployment - requiring reviews before merging code
    * Limit automated access to the source code to read-only
    * Verify source code access requires MFA
* [source-scanning](): These controls are more complicated to deploy because they require integrating scanning tools.
    * Verify no Secrets in Source Code
    * Verify acceptable level of vulnerabilities in source code
* [access-control-level-2](): These controls are even more complicated to deploy, because they require changes by the programmers or require a more complex policy.
    * Verify signed commits
    * Verify contributors roles
    * Verify source code access requires Fresh SSH keys




### Verify materials category
This category consists of the following best practices:
* Verify that dependencies meet your minimum thresholds for quality and reliability
* Verify that depdenencies meet your minimum thresholds for security and license compliance
* Monitor dependencies for updates and security issues
* Independently compile open-source packages used (Don't use binary depdendencies)
* Create an SBOM of artefacts

We recommend to adopt these best practices gradually, by deploying the following initiatives:
* [sbom-generation](sbom-generation/README.md)
After deploying SBOM generation, utilize ScribeHub SaaS to verify the materials:
* [open-source-packages-security-and-license-compliance]()
    * Security, quality and license compliance of open-source packages used in a product.

### Protecting build pipelines
        **TBD**

Do you use hardened, minimal containers as the foundation for your build workers?

Do you maintain your build and test pipelines as Infrastructure-as-Code?

Do you automate every step in your build pipeline outside of code reviews and final sign-offs?

Do you sign the output of every step in your build pipeline to provide a verifiable guarantee?

Do you validate the signatures and checksums of all dependencies before ingesting them in a build stage?

Do you use separate build workers/containers for each step in your build pipeline?

Do your pipeline orchestrator pass in the environments, tools, and commands allowed on each build worker?

Do you network isolate your build workers and pipeline as much as possible?

Do you produce verifiable, reproducible builds?

### Protecting artefacts and deployments category
* Enable verifying the integrity of the artefacts
* Verify the integrity of the artefacts

We recommend to adopt these best practices gradually, by deploying the following initiatives:
* [signed-image-sbom-generation](signed-image-sbom-generation/README.md)
    * This initiative is more complex: it requires verifying SBOM generation, and that the SBOMs are signed. 
* [use-of-signed-images](use-of-signed-images/README.md)
    * This initiative verifies that images used in a K8s cluster are signed. It can be deployed as an admission-controller or as an external workflow that samples the K8s cluster and verifies that all images are signed.



