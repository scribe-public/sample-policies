# access-control-level-1 initiative

## Initiative overview

* Verify branch protection deployment - requiring reviews before merging code
* Limit automated access to the source code to read-only
* Verify source code access requires MFA

## Implementation

* Choose the version of the initiative that is appropriate for your SCM plafrom
    * [GitHub](github/README.md)
    * [GitLab](gitlab/README.md)

* Run it by integrating `valint` into your CI/CD pipeline:

```bash
valint verify --initiative cncf-sscp/access-control-level-1 -product-key my-product ...
```