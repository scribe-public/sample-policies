# Sample Policies

This repo includes samples of policy configuraions for Scribe's ```valint``` tool.

## Preparation

1. Install valint:

    ```bash
    curl -sSfL https://get.scribesecurity.com/install.sh  | sh -s -- -t valint
    ```

2. Clone this repo.

## Policy Catalogue

Policy list below is copied from the `opapi` repo. Each policy in the table that has an example in this repo has a link to the policy description.

| Policy | Description | Attestations | Additional Info |
| --- | --- | --- | --- |
| [Artifact Signed](#artifact-signed) | Verify that the artifact is signed (also verify identity and CA identity) | [SBOM](#sboms) |
| [Blacklist Packages](#blacklist-packages) | Verify that banned packages are not in SBOM | [SBOM](#sboms) |
| [Required Packages](#required-packages) (e.g. license artifact) | Verify that required packages or files are in SBOM | [SBOM](#sboms) |
| [Banned Licenses](#banned-licenses) | Verify that banned licenses are not in SBOM | [SBOM](#sboms) |
| [Complete Licenses](#complete-licenses) | Verify that all packages have a license | [SBOM](#sboms) |
| [Fresh SBOM](#fresh-sbom) | Verify that SBOM is fresh | [SBOM](#sboms) |
| [Fresh Image](#fresh-image) | Verify that image is fresh - (rebuilt from latest) | [Image SBOM](#images) |
| [Image Does Not Allow Shell Access](#image-does-not-allow-shell-access) | Verify that the image has an entrypoint | [Image SBOM](#images) | `gensbom` [PR#166](https://github.com/scribe-security/gensbom/pull/166) needs to be merged |
| [Image Build Did Not Run Blind Scripts](#image-build-did-not-run-blind-scripts) | Verify that the image build commands did not include curl | [Image SBOM](#images) |
| [Image Included Required Lables](#image-included-required-lables) | Verify that the image has required labels. Used to enforce best practices such as labling the image with the git-commit used to build it (provenance) | [Image SBOM](#images) | `gensbom` [PR#166](https://github.com/scribe-security/gensbom/pull/166) needs to be merged |
| [Do Not Allow Huge Images](#large-image) | Verify that the image is not too large | [Image SBOM](#images) |
| [Coding Permissions](#coding-permissions) | Verify that allowed identities have modified specific files in a repo | [Git SBOM](#git) |
| Merging Permissions | Verify that allowed identities have merged to main  | [Git SBOM](#git) | Is it the opposite from [No Commits To Main](#no-commits-to-main)? |
| [No Unsigned Commits](#no-unsigned-commits) | Verify all commits are signed | [Git SBOM](#git) |
| [No Commits To Main](#no-commits-to-main) | Verify that no commits are made to main | [Git SBOM](#git) |
| Verify Provenance Exists | Verify that provenance for an artifact exists | [SLSA-Prov](#slsa) | Should it be a policy or an error from the `valint` itself? |
| [Verify Use of Specific Builder](#builder-name) | Verify that a specific builder was used to build an artifact | [SLSA-Prov](#slsa) |
| [Banned Builder Dependencies](#banned-builder-dependencies) | Verify that the builder used to build an artifact does not have banned dependencies (such as an old openSSL version) | [SLSA-Prov](#slsa) |
| [Verify Build Time](#build-time) | Verify that the build was done in a specific time window (working day)| [SLSA-Prov](#slsa) |
| Verify Byproducts Produced | Verify that specific byproducts are produced (e.g. testing, coverage, static analysis reports) | [SLSA-Prov](#slsa) | An example needed |
| [No Critical CVEs](#no-critical-cves) | Verify that the artifact does not have any ctitical CVEs | [SARIF](#sarif-reports) |
| [Limit High CVEs](#limit-high-cves) | Verify that the artifact does not have more than a specific number of high CVEs | [SARIF](#sarif-reports) |
| [Do Not Allow Specific CVEs](#do-not-allow-specific-cves) | Verify that the artifact does not have specific CVEs | [SARIF](#sarif-reports) |
| [No Static Analysis Errors](#no-static-analysis-errors) | Verify that the artifact does not have static analysis errors | [SARIF](#sarif-reports) |
| [Limit Static Analysis Warnings](#limit-static-analysis-warnings) | Verify that the artifact does not have more than a specific number of static analysis warnings | [SARIF](#sarif-reports) |
| [Do Not Allow Specific Static Analysis Rules](#do-not-allow-specific-static-analysis-rules) | Verify that the artifact does not have specific static analysis warnings | [SARIF](#sarif-reports) |
| No Package Downgrading | Verify that the artifact does not have any package downgrades | Two SBOMs |
| No License Modification | Verify that the artifact does not have any license modifications | Two SBOMs |
| Verify Source Integrity | Verify that the artifact source code has not been modified | Two SBOMs |
| Verify Dependencies Integrity (aka Verify specific files and folders integrity) | Verify that specific files or folders have not been modified | Two SBOMs |

### SBOMs

An example of creating an SBOM evidence:

```bash
valint bom ubuntu:latest -o statement-cyclonedx-json
```

To verify the evidence against the policy call:

```bash
valint verify ubuntu:latest -i statement-cyclonedx-json -c <policyname>.yaml
```

An example of creating signed SBOM attestation:

```bash
valint bom ubuntu:latest -o attest
```

To verify the attestation against the policy call:

```bash
valint verify ubuntu:latest -i attest -c <policyname>.yaml
```

#### Artifact Signed

This policy ([artifact-signed.yaml](policies/sboms/artifact-signed.yaml)) verifies that the SBOM is signed and the signer identity equals to a given value.

If you have not created an SBOM yet, create an sbom attestation, for example:

Edit policy parameters under ```attest.cocosign.policies.modules.input identity``` in the [artifact-signed.yaml](policies/sboms/artifact-signed.yaml) file:

```yaml
identity:
  emails:
    - mikey@resilience-sec.com
```

#### Blacklist Packages

This policy ([blacklist-packages.yaml](policies/sboms/blacklist-packages.yaml)) verifies that an SBOM does not include packages in the list of risky packages.

`rego` code for this policy can be found in the [blacklist-packages.rego](policies/sboms/blacklist-packages.rego) file.

Edit the list of the risky licenses in the `input.rego.args` parameter in file [blacklist-packages.yaml](policies/sboms/blacklist-packages.yaml):

```yaml
args = {blacklist: ["pkg:npm/readable-stream@1.0.34", "pkg:npm/trim@1.0.1"], blacklisted_limit :0}
```

#### Required Packages

This policy ([required-packages.yaml](policies/sboms/required-packages.yaml)) verifies that the SBOM includes packages from the list of required packages.

Edit the list of the required packages in the `input.rego.args` parameter in file [required-packages.yaml](policies/sboms/required-packages.yaml):

```yaml
args: {required_pkgs: ["pkg:deb/ubuntu/bash@5.1-6ubuntu1?arch=amd64\u0026distro=ubuntu-22.04"], violations_limit: 1}
```

The policy checks if there is a package listed in SBOM whose name contains the name of a required package as a substring. For example, if the package name is ```pkg:deb/ubuntu/bash@5.1-6ubuntu1?arch=amd64\u0026distro=ubuntu-22.04```, it will match any substring, like just ```bash``` or ```bash@5.1-6ubuntu1```.

#### Banned licenses

This policy ([banned-licenses.yaml](policies/sboms/banned-licenses.yaml)) verifies that the SBOM does not include licenses in the list of risky licenses.

Edit the list of the risky licenses in the `input.rego.args` parameter in file [banned-licenses.yaml](policies/sboms/banned-licenses.yaml):

```yaml
args: {blacklist: {"GPL", "MPL"}, blacklisted_limit : 10}
```

#### Complete Licenses

This policy ([complete-licenses.yaml](policies/sboms/complete-licenses.yaml)) verifies that every package in the SBOM has a license.

It doesn't have any additional parameters.

#### Fresh SBOM

This policy ([fresh-sbom.yaml](policies/sboms/fresh-sbom.yaml)) verifies that the SBOM is not older than a given number of days.

Edit the policy in the `input.rego.args` parameter in file [fresh-sbom.yaml](policies/sboms/fresh-sbom.yaml):

```yaml
args: {max_days : 30}
```

### Images

An example of creating an evidence:

```bash
valint bom ubuntu:latest -o statement
```

To verify the evidence against the policy:

```bash
valint verify ubuntu:latest -i statement -c <policyname>.yaml
```

#### Image Does Not Allow Shell Access

This policy ([no-shell-access.yaml](policies/images/no-shell-access.yaml)) verifies that the image does not allow shell access. It does so by verifying that both `Entrypoint` and `Cmd` don't contain `sh` (there's an exclusion for `.sh` though).

This policy is not configurable.

#### Image Build Did Not Run Blind Scripts

This policy ([no-blind-scripts.yaml](policies/images/no-blind-scripts.yaml)) verifies that the image did not run blacklisted scripts on build.

Edit the list of the blacklisted scripts in the `input.rego.args` parameter in file [no-blind-scripts.yaml](policies/images/no-blind-scripts.yaml):

```yaml
args: {blacklist: ["curl"]}
```

#### Image Included Required Lables

This policy ([labels.yaml](policies/images/labels.yaml)) verifies that the image includes required labels.

Edit the list of the required labels in the config object in file [labels.yaml](policies/images/labels.yaml):

```yaml
args: {labels: [{"label": "org.opencontainers.image.version", "value": "22.04"}]}
```

#### Fresh Image

This policy ([fresh-image.yaml](policies/images/fresh-image.yaml)) verifies that the image is not older than a given number of days.

Edit the policy in the `input.rego.args` parameter in file [fresh-image.yaml](policies/images/fresh-image.yaml):

```yaml
args: {max_days: 183}
```

#### Large Image

This policy ([](policies/images/large-image.yaml)) verifies that the image is not larger than a given size.

Set max size in bytes in the `input.rego.args` parameter in file [large-image.yaml](policies/images/large-image.yaml):

```yaml
args: {max_size: 77808811}
```

### Git

An example of creating a Git evidence:

```bash
valint bom git:https://github.com/golang/go -o statement
```

To verify the evidence against the policy:

```bash
valint verify git:https://github.com/golang/go -i statement -c <policyname>.yaml
```

#### Coding Permissions

This policy ([coding-permissions.yaml](policies/git/coding-permissions.yaml)) verifies that no unauthorized identities have modified specific files in a repo.

For this policy be able to run, the evidence must include a reference to the files that were modified in the commit. This can be done by adding parameter `--components commits,files` to the `valint bom` command.

For specifying the list of files and identities, edit the `input.rego.args` parameter in file [coding-permissions.yaml](policies/git/coding-permissions.yaml).
This example for repository [Golang Build](https://github.com/golang/build) verifies that files `build.go` and `internal/https/README.md` were modified only by identities containing `@golang.com` and `@golang.org`:

```yaml
args: {ids: ["@golang.com", "@golang.org"], files: ["build.go", "internal/https/README.md"]}
```

#### No Unsigned Commits

This policy ([no-unsigned-commits.yaml](policies/git/no-unsigned-commits.yaml)) verifies that evidence has no unsigned commits.

#### No Commits To Main

This policy ([no-commit-to-main.yaml](policies/git/no-commit-to-main.yaml)) verifies that evidence has no commits made to main branch.

### SLSA

Example of creating a SLSA statement:

```bash
valint slsa ubuntu:latest -o statement
```

Example of verifying a SLSA statement:

```bash
valint verify ubuntu:latest -i statement-slsa -c <policyname>.yaml
```

#### Builder name

This policy ([builder.yaml](policies/slsa/builder.yaml)) verifies that the builder name of the SLSA statement equals to a given value.

Edit policy parameters in the `input.rego.args` parameter in file [builder.yaml](policies/slsa/builder.yaml):

```yaml
args: {id: "local"}
```

#### Banned Builder Dependencies

This policy ([banned-builder-deps.yaml](policies/slsa/banned-builder-deps.yaml)) verifies that the builder used to build an artifact does not have banned dependencies (such as an old openSSL version).

Edit policy parameters in the `input.rego.args` parameter in file [banned-builder-deps.yaml](policies/slsa/banned-builder-deps.yaml):

```yaml
args: {blacklist: [{"uri": "valint", "tag": "v0.3.1"}]}
```

`uri` can be any substring of the searchable URI, and `tag` should be the exact `tag` or `git_tag` of the dependency.

#### Build Time

This policy ([build-time.yaml](policies/slsa/build-time.yaml)) verifies that the build time of the SLSA statement is within a given time window.

Edit policy parameters in the `input.rego.args` parameter in file [build-time.yaml](policies/slsa/build-time.yaml):

```yaml
args: {start_hour: 8,end_hour  : 17,workdays  : ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday"]}
```

### Sarif Reports

#### Generic SARIF Policy

This policy allows to verify any SARIF report against a given policy. The policy has several parameters to check against:

* ruleLevel: the level of the rule, can be "error", "warning", "note", "none"
* ruleIds: the list of the rule IDs to check against
* precision: the precision of the check, can be "exact", "substring", "regex"
* ignore: the list of the rule IDs to ignore
* maxAllowed: the maximum number of violations allowed

These values can be changed in the `input.rego.args` section in the [generic-sarif.yaml](policies/sarif/generic-sarif.yaml) file.

Create a trivy sarif report of the vulnerabilities of an image:

```bash
trivy image ubuntu:latest -f sarif -o ubuntu-cve.json
```

Create an evidence from this report:

```bash
valint bom ubuntu-cve.json --predicate-type http://scribesecurity.com/evidence/generic/v0.1  -o statement-generic
```

Verify the attestation against the policy:

```bash
valint verify ubuntu-cve.json -i statement-generic -c generic-sarif.yaml
```

##### No Critical CVEs

To verify that the SARIF report does not contain any critical CVEs, set the following parameters in the `rego.args` section in the[generic-sarif.yaml](policies/sarif/generic-sarif.yaml) file:

```yaml
args: {
   rule_level: ["critical"],
   precision: [],
   rule_ids: [],
   ignore: [],
   max_allowed: 0
}
```

##### Limit High CVEs

To verify that the SARIF report does not contain more than 10 high CVEs, set the following parameters in the `rego.args` section in the[generic-sarif.yaml](policies/sarif/generic-sarif.yaml) file:

```yaml
args: {
   rule_level: ["high"],
   precision: [],
   rule_ids: [],
   ignore: [],
   max_allowed: 10
}
```

##### Do Not Allow Specific CVEs

To verify that the SARIF report does not contain CVE-2021-1234 and CVE-2021-5678, set the following parameters in the `rego.args` section in the[generic-sarif.yaml](policies/sarif/generic-sarif.yaml) file:

```yaml
args: {
   rule_level: ["error", "warning", "note", "none"],
   precision: [],
   rule_ids: ["CVE-2021-1234", "CVE-2021-5678"],
   ignore: [],
   max_allowed: 0
}
```

##### No Static Analysis Errors

To verify that the SARIF report does not contain any static analysis errors, set the following parameters in the `rego.args` section in the[generic-sarif.yaml](policies/sarif/generic-sarif.yaml) file:

```yaml
args: {
   rule_level: ["error"],
   precision: [],
   rule_ids: [],
   ignore: [],
   max_allowed: 0
}
```

##### Limit Static Analysis Warnings

To verify that the SARIF report does not contain more than 10 static analysis warnings, set the following parameters in the `rego.args` section in the[generic-sarif.yaml](policies/sarif/generic-sarif.yaml) file:

```yaml
args: {
   rule_level: ["warning"],
   precision: [],
   rule_ids: [],
   ignore: [],
   max_allowed: 10
}
```

##### Do Not Allow Specific Static Analysis Rules

To verify that the SARIF report does not contain static analysis warnings from the following rules: "rule1", "rule2", "rule3", set the following parameters in the `rego.args` section in the[generic-sarif.yaml](policies/sarif/generic-sarif.yaml) file:

```yaml
args: {
   rule_level: ["error", "warning", "note", "none"],
   precision: [],
   rule_ids: ["rule1", "rule2", "rule3"],
   ignore: [],
   max_allowed: 0
}
```

## Writing Policy Files

The rego policies can be written either as snippets in the yaml file, or as separate rego files. The advantage of using separate rego files is that one can enjoy the IDE support for rego, such as syntax highlighting and linting, and one can test the rego code more easily.

An example of such a rego file is give in the [generic-sarif.rego](policies/sarif/generic-sarif.rego) file, that is consumed by the [generic-sarif.yaml](policies/sarif/generic-sarif.yaml) configuraion file. To evaluate the policy:

```bash
valint verify ubuntu-cve.json -i statement-generic -c generic-sarif.yaml
```

## Running multiple policies at once

It's possible to run multiple policies at once by specifying multiple modules under `cocosign.policies.modules` config. An example can be found in [policies/sboms/multiple-policies.yaml](policies/sboms/multiple-policies.yaml).
