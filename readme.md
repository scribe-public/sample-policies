# Sample Policies

This repo includes samples of policy configuraions for Scribe's ```valint``` tool.

## Preparation

1. Install `valint`:

    ```bash
    curl -sSfL https://get.scribesecurity.com/install.sh  | sh -s -- -t valint
    ```

2. Clone this repo.

## Policy Catalogue

Policy list below is copied from the `opapi` repo. Each policy in the table that has an example in this repo has a link to the policy description.

| Policy | Description | Attestation Type | Additional Info |
| --- | --- | --- | --- |
| [Forbid Unsigned Artifacts](#forbid-unsigned-artifacts) | Verify the artifact's authenticity and signer identity. | Attestation | [SBOM](#sboms) |
| [Blocklist Packages](#blocklist-packages) | Prevent risky packages in the artifact. | Attestation | [SBOM](#sboms) |
| [Required Packages](#required-packages) | Ensure mandatory packages/files in the artifact. | Attestation | [SBOM](#sboms) |
| [Banned Licenses](#banned-licenses) | Restrict inclusion of certain licenses in the artifact. | Attestation | [SBOM](#sboms) |
| [Complete Licenses](#complete-licenses) | Guarantee all packages have valid licenses. | Attestation | [SBOM](#sboms) |
| [Fresh Artifact](#fresh-artifact) | Verify an artifact's freshness. | Attestation | [SBOM](#sboms) |
| [Fresh Image](#fresh-image) | Ensure an image freshness. | Attestation | [Image SBOM](#images) |
| [Restrict Shell Image Entrypoint](#restrict-shell-image-entrypoint) | Prevent shell as image entrypoint. | Attestation | [SBOM](#sboms) |
| [Blocklist Image Build Scripts](#blocklist-image-build-scripts) | Restrict build scripts in image build. | Attestation | [Image SBOM](#images) |
| [Verify Image Lables/Annotations](#verify-image-lablesannotations) | Ensure image has required labels (e.g., git-commit). | Attestation | [SBOM](#sboms)  |
| [Forbid Huge Images](#forbid-large-images) | Limit image size. | Attestation | [Image SBOM](#images) |
| [Coding Permissions](#coding-permissions) | Control file modifications by authorized identities. | Attestation | [Git SBOM](#git) |
| Merging Permissions | Ensure authorized identities merge to main. | Attestation | Counterpart to [Forbid Commits To Main](#forbid-commits-to-main)? |
| [Forbid Unsigned Commits](#forbid-unsigned-commits) | Prevent unsigned commits in evidence. | Attestation | [Git SBOM](#git) |
| [Forbid Commits To Main](#forbid-commits-to-main) | Verify there were no commits to the main branch. | Attestation | [Git SBOM](#git) |
| Verify Provenance Exists | Confirm artifact provenance exists. | Attestation | [SLSA-Prov](#slsa) |
| [Verify Use of Specific Builder](#builder-name) | Enforce use of a specific builder for artifact. | Attestation | [SLSA-Prov](#slsa) |
| [Banned Builder Dependencies](#banned-builder-dependencies) | Restrict banned builder dependencies. | Attestation | [SLSA-Prov](#slsa) |
| [Verify Build Time](#build-time) | Validate build time within window. | Attestation | [SLSA-Prov](#slsa) |
| Verify Byproducts Produced | Ensure specific byproducts are produced. | Attestation | [SLSA-Prov](#slsa) |
| [No Critical CVEs](#no-critical-cves) | Prohibit ANY critical CVEs. | Attestation | [SARIF](#sarif-reports) |
| [Limit High CVEs](#limit-high-cves) | Limit high CVEs. | Attestation | [SARIF](#sarif-reports) |
| [Do Not Allow Specific CVEs](#do-not-allow-specific-cves) | Prevent specific CVEs in the artifact. | Attestation | [SARIF](#sarif-reports) |
| [No Static Analysis Errors](#no-static-analysis-errors) | Prevent static analysis errors in the artifact. | Attestation | [SARIF](#sarif-reports) |
| [Limit Static Analysis Warnings](#limit-static-analysis-warnings) | Restrict static analysis warnings count. | Attestation | [SARIF](#sarif-reports) |
| [Do Not Allow Specific Static Analysis Rules](#do-not-allow-specific-static-analysis-rules) | Restrict specific static analysis warnings. | Attestation | [SARIF](#sarif-reports) |
| [Do Not Allow Vulnerabilities Based On Specific Attack Vector](#do-not-allow-vulnerabilities-based-on-specific-attack-vector) | Restrict vulnerabilities based on specific attack vector. | Attestation | [SARIF](#sarif-reports) |
| [Forbid Accessing Host](#forbid-accessing-host) | Do not allow images with detected vulnerabilities giving access to the host system. | Generic Evidence | [Generic](#generic) |
| No Package Downgrading | Restrict package downgrades. | Attestation | src and dst [SBOM](#sboms) |
| No License Modification | Prevent license modifications. | Attestation | src and dst [SBOM](#sboms) |
| Verify Source code Integrity | Verify that the artifact source code has not been modified | Attestation | src and dst [Git SBOM](#git) |
| Verify Dependencies Integrity | Verify that specific files or folders have not been modified | Attestation | src and dst [SBOM](#sboms) |

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

#### Forbid Unsigned Artifacts

This policy ([artifact-signed.yaml](policies/sboms/artifact-signed.yaml)) verifies that the SBOM is signed and the signer identity equals to a given value.

If you have not created an SBOM yet, create an sbom attestation, for example:

In [artifact-signed.yaml](policies/sboms/artifact-signed.yaml) file,
edit policy parameters ```attest.cocosign.policies.modules.input identity``` to reflect the expected signers identity.

You can also edit `target_type` to refelct the artifact type.

> Optional target types are `git`,`directory`, `image`, `file`, `generic`.

```yaml
identity:
  emails:
    - example@company.com
match:
   target_type: image
```

#### Blocklist Packages

This policy ([blocklist-packages.yaml](policies/sboms/blocklist-packages.yaml), [blocklist-packages.rego](policies/sboms/blocklist-packages.rego)) verifies an SBOM does not include packages in the list of risky packages.

`rego` code for this policy can be found in the [blocklist-packages.rego](policies/sboms/blocklist-packages.rego) file.

Edit the list of the risky licenses in the `input.rego.args` parameter in file [blocklist-packages.yaml](policies/sboms/blocklist-packages.yaml):

```yaml
args:
   blocklist: 
      - "pkg:deb/ubuntu/tar@1.34+dfsg-1ubuntu0.1.22.04.1?arch=arm64&distro=ubuntu-22.04"
      - "log4j"
   blocklisted_limit: 0
```

#### Required Packages

This policy ([required-packages.yaml](policies/sboms/required-packages.yaml), [required-packages.rego](policies/sboms/required-packages.rego)) verifies that the SBOM includes packages from the list of required packages.

Edit the list of the required packages in the `input.rego.args` parameter in file [required-packages.yaml](policies/sboms/required-packages.yaml):

```yaml
args:
   required_pkgs:
      - "pkg:deb/ubuntu/bash@5.1-6ubuntu1?arch=amd64\u0026distro=ubuntu-22.04"
   violations_limit: 1
```

The policy checks if there is a package listed in SBOM whose name contains the name of a required package as a substring. For example, if the package name is ```pkg:deb/ubuntu/bash@5.1-6ubuntu1?arch=amd64\u0026distro=ubuntu-22.04```, it will match any substring, like just ```bash``` or ```bash@5.1-6ubuntu1```.

#### Banned Licenses

This policy ([banned-licenses.yaml](policies/sboms/banned-licenses.yaml), [banned-licenses.rego](policies/sboms/banned-licenses.rego)) verifies that the SBOM does not include licenses from the list of risky licenses.

Edit the list of the risky licenses in the `input.rego.args` parameter in file [banned-licenses.yaml](policies/sboms/banned-licenses.yaml):

```yaml
rgs:
   blocklist: 
      - GPL
      - MPL
   blocklisted_limit : 10
```

#### Complete Licenses

This policy ([complete-licenses.yaml](policies/sboms/complete-licenses.yaml), [complete-licenses.rego](policies/sboms/complete-licenses.rego)) verifies that every package in the SBOM has a license.

It doesn't have any additional parameters.

#### Fresh Artifact

This policy ([fresh-sbom.yaml](policies/sboms/fresh-sbom.yaml)) verifies that the SBOM is not older than a given number of days.

Edit the policy in the `input.rego.args` parameter in file [fresh-sbom.yaml](policies/sboms/fresh-sbom.yaml):

```yaml
args:
   max_days : 30
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

#### Restrict Shell Image Entrypoint

This policy ([restrict-shell-entrypoint.yaml](policies/images/restrict-shell-entrypoint.yaml), [restrict-shell-entrypoint.rego](policies/images/restrict-shell-entrypoint.rego)) verifies that the image entrypoint does not provide shell access by default. It does so by verifying that both `Entrypoint` and `Cmd` don't contain `sh` (there's an exclusion for `.sh` though).

This policy is not configurable.

#### Blocklist Image Build Scripts

This policy ([blocklist-build-scripts.yaml](policies/images/blocklist-build-scripts.yaml), [blocklist-build-scripts.rego](policies/images/blocklist-build-scripts.rego)) verifies that the image did not run blocklisted scripts on build.

Edit the list of the blocklisted scripts in the `input.rego.args` parameter in file [blocklist-build-scripts.yaml](policies/images/no-build-scripts.yaml):

```yaml
args:
   blocklist: 
      - curl
```

#### Verify Image Lables/Annotations

This policy ([verify-labels.yaml](policies/images/verify-labels.yaml), [verify-labels.rego](policies/images/verify-labels.rego)) verifies that image has labels with required values.

Edit the list of the required labels in the config object in file [verify-labels.yaml](policies/images/verify-labels.yaml):

```yaml
args:
   labels:
      - label: "org.opencontainers.image.version"
        value: "22.04"
```

#### Fresh Image

This policy ([fresh-image.yaml](policies/images/fresh-image.yaml), [fresh-image.rego](policies/images/fresh-image.rego)) verifies that the image is not older than a given number of days.

Edit the policy in the `input.rego.args` parameter in file [fresh-image.yaml](policies/images/fresh-image.yaml):

```yaml
args:
   max_days: 183
```

#### Forbid Large Images

This policy ([forbid-large-images.yaml](policies/images/forbid-large-images.yaml), [forbid-large-images.rego](policies/images/forbid-large-images.rego)) verifies that the image is not larger than a given size.

Set max size in bytes in the `input.rego.args` parameter in file [forbid-large-images.yaml](policies/images/forbid-large-images.yaml):

```yaml
args:
   max_size: 77808811
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

This policy ([coding-permissions.yaml](policies/git/coding-permissions.yaml), [coding-permissions.rego](policies/git/coding-permissions.rego)) verifies that files from the specified list were modified by authorized users only.

For this policy be able to run, the evidence must include a reference to the files that were modified in the commit. This can be done by adding parameter `--components commits,files` to the `valint bom` command.

For specifying the list of files and identities, edit the `input.rego.args` parameter in file [coding-permissions.yaml](policies/git/coding-permissions.yaml).
This example for repository [Golang Build](https://github.com/golang/build) verifies that files `build.go` and `internal/https/README.md` were modified only by identities containing `@golang.com` and `@golang.org`:

```yaml
args:
   ids:
      - "@golang.com"
      - "@golang.org"
   files:
      - "a.txt"
      - "somedir/b.txt"
```

#### Forbid Unsigned Commits

This policy ([no-unsigned-commits.yaml](policies/git/no-unsigned-commits.yaml), [no-unsigned-commits.rego](policies/git/no-unsigned-commits.rego)) verifies that evidence has no unsigned commits. It does not verify the signatures though.

#### Forbid Commits To Main

This policy ([no-commit-to-main.yaml](policies/git/no-commit-to-main.yaml), [no-commit-to-main.rego](policies/git/no-commit-to-main.rego)) verifies that evidence has no commits made to main branch.

### SLSA

Example of creating a SLSA statement:

```bash
valint slsa ubuntu:latest -o statement
```

Example of verifying a SLSA statement:

```bash
valint verify ubuntu:latest -i statement-slsa -c <policyname>.yaml
```

#### Builder Name

This policy ([verify-builder.yaml](policies/slsa/verify-builder.yaml), [verify-builder.rego](policies/slsa/verify-builder.rego)) verifies that the builder name of the SLSA statement equals to a given value.

Edit policy parameters in the `input.rego.args` parameter in file [verify-builder.yaml](policies/slsa/verify-builder.yaml):

```yaml
args:
   id: "local"
```

#### Banned Builder Dependencies

This policy ([banned-builder-deps.yaml](policies/slsa/banned-builder-deps.yaml), [banned-builder-deps.rego](policies/slsa/banned-builder-deps.rego)) verifies that the builder used to build an artifact does not have banned dependencies (such as an old openSSL version).

Edit policy parameters in the `input.rego.args` parameter in file [banned-builder-deps.yaml](policies/slsa/banned-builder-deps.yaml):

```yaml
args:
   blocklist:
      - name: "valint"
         version: "0.0.0"
```

#### Build Time

This policy ([build-time.yaml](policies/slsa/build-time.yaml), [build-time.rego](policies/slsa/build-time.rego)) verifies that the build time of the SLSA statement is within a given time window The timezone is derived from the timestamp in the statement.

Edit policy parameters in the `input.rego.args` parameter in file [build-time.yaml](policies/slsa/build-time.yaml):

```yaml
args:
   start_hour: 8
   end_hour: 20
   workdays:
      - "Sunday"
      - "Monday"
      - "Tuesday"
      - "Wednesday"
      - "Thursday"
```

### Sarif Reports

#### Generic SARIF Policy

This policy ([verify-sarif.yaml](policies/sarif/verify-sarif.yaml), [verify-sarif.rego](policies/sarif/verify-sarif.rego)) allows to verify any SARIF report against a given policy. The policy has several parameters to check against:

* ruleLevel: the level of the rule, can be "error", "warning", "note", "none"
* ruleIds: the list of the rule IDs to check against
* precision: the precision of the check, can be "exact", "substring", "regex"
* ignore: the list of the rule IDs to ignore
* maxAllowed: the maximum number of violations allowed

These values can be changed in the `input.rego.args` section in the [verify-sarif.yaml](policies/sarif/verify-sarif.yaml) file.

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
valint verify ubuntu-cve.json -i statement-generic -c verify-sarif.yaml
```

##### No Critical CVEs

To verify that the SARIF report does not contain any critical CVEs, set the following parameters in the `rego.args` section in the[verify-sarif.yaml](policies/sarif/verify-sarif.yaml) file:

```yaml
args:
   rule_level:
      - critical
   precision: []
   rule_ids: []
   ignore: []
   max_allowed: 0
```

##### Limit High CVEs

To verify that the SARIF report does not contain more than specified number of CVEs with high level (let's say 10), set the following parameters in the `rego.args` section in the[verify-sarif.yaml](policies/sarif/verify-sarif.yaml) file:

```yaml
args:
   rule_level: high,
   precision: []
   rule_ids: []
   ignore: []
   max_allowed: 10
```

##### Do Not Allow Specific CVEs

To verify that the SARIF report does not contain certain CVEs (let's say CVE-2021-1234 and CVE-2021-5678), set the following parameters in the `rego.args` section in the[verify-sarif.yaml](policies/sarif/verify-sarif.yaml) file:

```yaml
args:
   rule_level:
      - "error"
      - "warning"
      - "note"
      - "none"
   precision: []
   rule_ids:
      - "CVE-2021-1234"
      - "CVE-2021-5678"
   ignore: []
   max_allowed: 0
```

##### No Static Analysis Errors

To verify that the SARIF report does not contain any static analysis errors, set the following parameters in the `rego.args` section in the[verify-sarif.yaml](policies/sarif/verify-sarif.yaml) file:

```yaml
args:
   rule_level:
      - "error"
   precision: []
   rule_ids: []
   ignore: []
   max_allowed: 0
```

##### Limit Static Analysis Warnings

To verify that the SARIF report does not contain more than specified number of static analysis warnings (let's say 10), set the following parameters in the `rego.args` section in the[verify-sarif.yaml](policies/sarif/verify-sarif.yaml) file:

```yaml
args:
   rule_level:
      - "warning"
   precision: []
   rule_ids: []
   ignore: []
   max_allowed: 10
```

##### Do Not Allow Specific Static Analysis Rules

To verify that the SARIF report does not contain static analysis warnings from the following rules: "rule1", "rule2", "rule3", set the following parameters in the `rego.args` section in the[verify-sarif.yaml](policies/sarif/verify-sarif.yaml) file:

```yaml
args:
   rule_level:
      - "error"
      - "warning"
      - "note"
      - "none"
   precision: []
   rule_ids:
      - "rule1"
      - "rule2"
      - "rule3"
   ignore: []
   max_allowed: 0
```

##### Do Not Allow Vulnerabilities Based On Specific Attack Vector

Trivy/grype reports usually contain descriptions for some CVEs, like impact and attack vector.
This policy ([verify-attack-vector.yaml](policies/sarif/verify-attack-vector.yaml), [verify-attack-vector.rego](policies/sarif/verify-attack-vector.rego)) is meant to restrict number of vulnerabilities with specific attack vectors.
For example, to restrict vulnerabilities with attack vector "stack buffer overflow", set the following parameters in the `rego.args` section in the [verify-attack-vector.yaml](policies/sarif/verify-attack-vector.yaml) file:

```yaml
args:
   attack_vectors:
      - "stack buffer overflow"
   violations_threshold: 0
```

Then run the policy against the SARIF report as described above.

### Forbid Accessing Host

Trivy k8s analysis can highlight some misconfigurations which allow container to access host filesystem or network. The goal of this policy is to detect such misconfigurations.

To run this policy one has to create a Trivy k8s report and create a generic statement with `valint` from it. Then, simply run the policy against this statement. No additional ocnfiguration required.

## Writing Policy Files

The rego policies can be written either as snippets in the yaml file, or as separate rego files. The advantage of using separate rego files is that one can enjoy the IDE support for rego, such as syntax highlighting and linting, and one can test the rego code more easily.

An example of such a rego file is give in the [verify-sarif.rego](policies/sarif/verify-sarif.rego) file, that is consumed by the [verify-sarif.yaml](policies/sarif/verify-sarif.yaml) configuraion file. To evaluate the policy:

```bash
valint verify ubuntu-cve.json -i statement-generic -c verify-sarif.yaml
```

## Running multiple policies at once

It's possible to run multiple policies at once by specifying multiple modules under `cocosign.policies.modules` config. An example can be found in [policies/sboms/multiple-policies.yaml](policies/sboms/multiple-policies.yaml).
