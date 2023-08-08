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
| Image Does Not Allow Shell Access | Verify that the image has an entrypoint | [Image SBOM](#images) | Some changes to `gensbom` needed |
| Image Build Did Not Run blind scripts | Verify that the image build commands did not include curl | [Image SBOM](#images) | Some changes to `gensbom` needed |
| Image Included Required Lables | Verify that the image has required labels. Used to enforce best practices such as labling the image with the git-commit used to build it (provenance) | [Image SBOM](#images) | Some changes to `gensbom` needed |
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
valint verify ubuntu:latest -i statement-cyclonedx-json -c <policyname>.yml
```

An example of creating signed SBOM attestation:

```bash
valint bom ubuntu:latest -o attest
```

To verify the attestation against the policy call:

```bash
valint verify ubuntu:latest -i attest -c <policyname>.yml
```

#### Artifact Signed

This policy ([artifact-signed.yaml](policies/sboms/artifact-signed.yaml)) verifies that the SBOM is signed and the signer identity equals to a given value.

If you have not created an SBOM yet, create an sbom attestation, for example:

Edit policy parameters under ```attest.cocosign.policies.modules.input identity``` in the [artifact-signed.yml](policies/sboms/artifact-signed.yaml) file:

```yaml
identity:
  emails:
    - mikey@resilience-sec.com
```

#### Blacklist Packages

This policy ([blacklist-packages.yml](policies/sboms/blacklist-packages.yml)) verifies that an SBOM does not include packages in the list of risky packages.

Edit the list of the risky licenses in the config object, within the rego code in file [blacklist-packages.yml](policies/sboms/blacklist-packages.yml):

```rego
config := {
  "blacklist": ["pkg:npm/readable-stream@1.0.34", "pkg:npm/trim@1.0.1"],
  "blacklisted_limit":0
}

```

#### Required Packages

This policy ([required-packages.yml](policies/sboms/required-packages.yml)) verifies that the SBOM includes packages from the list of required packages.

Edit the list of the required packages in the config object, within the rego code in file [required-packages.yml](policies/sboms/required-packages.yml):

```rego
config := {
  "required_pkgs": ["pkg:npm/readable-stream@1.0.34", "pkg:npm/trim@1.0.1"],
  "violations_limit":0
}
```

The policy checks if there is a package listed in SBOM whose name contains the name of a required package as a substring. For example, if the package name is ```pkg:deb/ubuntu/bash@5.1-6ubuntu1?arch=amd64\u0026distro=ubuntu-22.04```, it will match any substring, like just ```bash``` or ```bash@5.1-6ubuntu1```.

#### Banned licenses

This policy ([banned-licenses.yml](policies/sboms/banned-licenses.yml)) verifies that the SBOM does not include licenses in the list of risky licenses.

Edit the list of the risky licenses in the config object, within the rego code in file [banned-licenses.yml](policies/sboms/banned-licenses.yml):

```rego
config := {
  "blacklist": {"GPL", "MPL"},
  "blacklisted_limit" : 200
}
```

#### Complete Licenses

This policy ([complete-licenses.yml](policies/sboms/complete-licenses.yml)) verifies that every package in the SBOM has a license.

It doesn't have any additional parameters.

#### Fresh SBOM

This policy ([fresh-sbom.yml](policies/sboms/fresh-sbom.yml)) verifies that the SBOM is not older than a given number of days.

Edit the policy in the config object, within the rego code in file [fresh-sbom.rego](policies/sboms/fresh-sbom.rego):

```rego
config := {
    "max_days" : 30
}
```

### Images

An example of creating an evidence:

```bash
valint bom ubuntu:latest -o statement
```

To verify the evidence against the policy:

```bash
valint verify ubuntu:latest -i statement -c <policyname>.yml
```

#### Fresh Image

This policy ([fresh-image.yaml](policies/images/fresh-image.yaml)) verifies that the image is not older than a given number of days.

Edit the policy in the config object, within the rego code in file [fresh-image.rego](policies/images/fresh-image.rego)):

```rego
config := {
    "max_days" : 183
}
```

#### Large Image

This policy ([](policies/images/large-image.yml)) verifies that the image is not larger than a given size.

Edit the policy in the config object, within the rego code in file [large-image.rego](policies/images/large-image.rego)):

```rego
config := {
    "max_size" : 100000000
}
```

### Git

An example of creating a Git evidence:

```bash
valint bom git:https://github.com/golang/go -o statement
```

To verify the evidence against the policy:

```bash
valint verify git:https://github.com/golang/go -i statement -c <policyname>.yml
```

#### Coding Permissions

This policy ([coding-permissions.yml](policies/git/coding-permissions.yml)) verifies that no unauthorized identities have modified specific files in a repo.

For this policy be able to run, the evidence must include a reference to the files that were modified in the commit. This can be done by adding parameter `--components commits,files` to the `valint bom` command.

For specifying the list of files and identities, edit the policy in the config object, within the rego code in file [coding-permissions.rego](policies/git/coding-permissions.rego).
This example for repository [Golang Build](https://github.com/golang/build) verifies that files `build.go` and `internal/https/README.md` were modified only by identities containing `@golang.com` and `@golang.org`:

```rego
config := {
    "ids": ["@golang.com", "@golang.org"],
    "files": ["build.go", "internal/https/README.md"],
}
```

#### No Unsigned Commits

This policy ([no-unsigned-commits.yml](policies/git/no-unsigned-commits.yml)) verifies that evidence has no unsigned commits.

#### No Commits To Main

This policy ([no-commit-to-main.yml](policies/git/no-commit-to-main.yml)) verifies that evidence has no commits made to main branch.

### SLSA

Example of creating a SLSA statement:

```bash
valint slsa ubuntu:latest -o statement
```

Example of verifying a SLSA statement:

```bash
valint verify ubuntu:latest -i statement-slsa -c <policyname>.yml
```

#### Builder name

This policy ([builder.yaml](policies/slsa/builder.yml)) verifies that the builder name of the SLSA statement equals to a given value.

Edit policy parameters in `rego` code in the [builder.yml](policies/slsa/builder.yml) file:

```rego
config := {
  "builderType": "local",
  "hostname": "builder1"
}
```

#### Banned Builder Dependencies

This policy ([banned-builder-deps.yaml](policies/slsa/banned-builder-deps.yaml)) verifies that the builder used to build an artifact does not have banned dependencies (such as an old openSSL version).

Edit policy parameters in `rego` code in the [banned-builder-deps.yml](policies/slsa/banned-builder-deps.yaml) file:

```rego
config := {
    "blacklist": [{"uri": "valint", "tag": "v0.3.1"}],
}
```

`uri` can be any substring of the searchable URI, and `tag` should be the exact `tag` or `git_tag` of the dependency.

#### Build Time

This policy ([build-time.yaml](policies/slsa/build-time.yml)) verifies that the build time of the SLSA statement is within a given time window.

Edit policy parameters in `rego` code in the [build-time.yaml](policies/slsa/build-time.yml) file:

```rego
config := {
  "start_hour": 8,
  "end_hour"  : 17,
  "workdays"  : ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday"],
}
```

### Sarif Reports

#### Generic SARIF Policy

This policy allows to verify any SARIF report against a given policy. The policy has several parameters to check against:

* ruleLevel: the level of the rule, can be "error", "warning", "note", "none"
* ruleIds: the list of the rule IDs to check against
* precision: the precision of the check, can be "exact", "substring", "regex"
* ignore: the list of the rule IDs to ignore
* maxAllowed: the maximum number of violations allowed

These values can be changed in the `config` section in the [generic-sarif.rego](policies/sarif/generic-sarif.rego) file.

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
valint verify ubuntu-cve.json -i statement-generic -c generic-sarif.yml
```

##### No Critical CVEs

To verify that the SARIF report does not contain any critical CVEs, set the following parameters in the `config` section in the[generic-sarif.rego](policies/sarif/generic-sarif.rego) file:

```rego
config := {
   "ruleLevel": ["critical"],
   "precision": [],
   "ruleIDs": [],
   "ignore": [],
   "maxAllowed": 0
}
```

##### Limit High CVEs

To verify that the SARIF report does not contain more than 10 high CVEs, set the following parameters in the `config` section in the[generic-sarif.rego](policies/sarif/generic-sarif.rego) file:

```rego
config := {
   "ruleLevel": ["high"],
   "precision": [],
   "ruleIDs": [],
   "ignore": [],
   "maxAllowed": 10
}
```

##### Do Not Allow Specific CVEs

To verify that the SARIF report does not contain CVE-2021-1234 and CVE-2021-5678, set the following parameters in the `config` section in the[generic-sarif.rego](policies/sarif/generic-sarif.rego) file:

```rego
config := {
   "ruleLevel": ["error", "warning", "note", "none"],
   "precision": [],
   "ruleIDs": ["CVE-2021-1234", "CVE-2021-5678"],
   "ignore": [],
   "maxAllowed": 0
}
```

##### No Static Analysis Errors

To verify that the SARIF report does not contain any static analysis errors, set the following parameters in the `config` section in the[generic-sarif.rego](policies/sarif/generic-sarif.rego) file:

```rego
config := {
   "ruleLevel": ["error"],
   "precision": [],
   "ruleIDs": [],
   "ignore": [],
   "maxAllowed": 0
}
```

##### Limit Static Analysis Warnings

To verify that the SARIF report does not contain more than 10 static analysis warnings, set the following parameters in the `config` section in the[generic-sarif.rego](policies/sarif/generic-sarif.rego) file:

```rego
config := {
   "ruleLevel": ["warning"],
   "precision": [],
   "ruleIDs": [],
   "ignore": [],
   "maxAllowed": 10
}
```

##### Do Not Allow Specific Static Analysis Rules

To verify that the SARIF report does not contain static analysis warnings from the following rules: "rule1", "rule2", "rule3", set the following parameters in the `config` section in the[generic-sarif.rego](policies/sarif/generic-sarif.rego) file:

```rego
config := {
   "ruleLevel": ["error", "warning", "note", "none"],
   "precision": [],
   "ruleIDs": ["rule1", "rule2", "rule3"],
   "ignore": [],
   "maxAllowed": 0
}
```

## Writing Policy Files

The rego policies can be written either as snippets in the yml file, or as separate rego files. The advantage of using separate rego files is that one can enjoy the IDE support for rego, such as syntax highlighting and linting, and one can test the rego code more easily.

An example of such a rego file is give in the [generic-sarif.rego](policies/sarif/generic-sarif.rego) file, that is consumed by the [generic-sarif.yml](policies/sarif/generic-sarif.yml) configuraion file. To evaluate the policy:

```bash
valint verify ubuntu-cve.json -i statement-generic -c generic-sarif.yml
```
