# Initiative Catalog

# Background

**Initiatives** are a way to organize and track policy deployment. In initiative is a collection of rules that are grouped together based on a common theme. This initiative catalog allows you to choose and easily deploy initiatives and measure, using ScribeHub, the progress of your policy deployment.

**Examples**: 
* If you are interested in adopting the practice of "Docker Images SBOM Generation" across your organization, you can use the `sbom-generation` initiative.
    * This initiative is very simple: at the end of each build pipeline, verify that an SBOM of the generated container image is available.
* If you are interested in adopting the practice of "Docker Images Signed SBOM Generation" accross your organization, you can use the `signed-image-sbom-generation` initiative.
    * This initiative is more complex: it requires verifying SBOM generation, and that the SBOMs are signed. In this case, the initiative is composed of two corresponding rules.
    * You can first deploy the `sbom-generation` initiative, and only when reaching enough adoption, deploy the `signed-image-sbom-generation` initiative, and use ScribeHub to monitor the progress of your policy deployment, and use the data you have collected to make informed decisions.

# Initiatives

* [scribe-recommended-best-practices](scribe-recommended-best-practices/README.md)
* [cncf-sscp](cncf-sscp/README.md)
    * Verify source code category
        * [access-control-level-1](cncf-sscp/access-control-level-1/README.md)
        * [source-scanning-level](cncf-sscp/source-scanning-level-1/README.md)
        * [access-control-level-2](cncf-sscp/access-control-level-2/README.md)
    * Verify materials category
        * [sbom-generation](cncf-sscp/sbom-generation/README.md)
        * [open-source-packages-security-and-license-compliance](cncf-sscp/open-source-packages-security-and-license-compliance/README.md)
    * Protecting build pipelines
        * **TBD**
    * Protecting artefacts and deployments
        * [signed-image-sbom-generation](signed-image-sbom-generation/README.md)
        * [signed-image-sbom-verification](signed-image-sbom-verification/README.md)
* [sbom-generation](sbom-generation/README.md)

