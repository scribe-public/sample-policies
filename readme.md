# Sample Policies

This repo includes samples of policy configuraions for Scribe's ```valint``` tool.

## Preparation

Install valint:

```bash
curl -sSfL https://get.scribesecurity.com/install.sh  | sh -s -- -t valint
```

Clone this repo.

## Policy catalogue

All the policies in this repo are splitted into categories based on the material they use for verification:

* [Images](#images)
  * [Fresh Image](#fresh-image)
  * [Large image](#large-image)
* [SARIF reports](#sarif-reports)
  * [Image CVE Policy](#image-cve-policy)
  * [Generic SARIF policy](#generic-sarif-policy)
    * [No critical CVEs](#no-critical-cves)
    * [Limit High CVEs](#limit-high-cves)
    * [Do not allow specific CVEs](#do-not-allow-specific-cves)
* [SBOMs](#sboms)
  * [Banned licenses](#banned-licenses)
  * [Blacklist packages](#blacklist-packages)
  * [Complete licenses](#complete-licenses)
  * [Fresh SBOM](#fresh-sbom)
  * [Required packages](#required-packages)
  * [Signed by](#signed-by)
* [SLSA](#slsa)
  * [Builder name](#builder-name)

### Images

#### Fresh Image

This policy verifies that the image is not older than a given number of days.

If you have not created an SBOM yet, create an sbom attestation, for example:

```bash
valint bom ubuntu:latest -o statement-cyclonedx-json
```

Edit the policy in the config object, within the rego code in file ```fresh-image.rego```:

```rego
config := {
    "max_days" : 183
}
```

Verify the attestation against the policy:

```bash
valint verify ubuntu:latest -i statement-cyclonedx-json -c fresh-image.yml
```

#### Large image

This policy verifies that the image is not larger than a given size.

If you have not created an SBOM yet, create an sbom attestation, for example:

```bash
valint bom ubuntu:latest -o statement-cyclonedx-json
```

Edit the policy in the config object, within the rego code in file ```large-image.rego```:

```rego
config := {
    "max_size" : 100000000
}
```

Verify the attestation against the policy:

```bash
valint verify ubuntu:latest -i statement-cyclonedx-json -c large-image.yml
```

### Sarif reports

#### Image CVE Policy

Create a trivy sarif report of the vulnerabilities of an image:

```bash
trivy image ubuntu:latest -f sarif -o ubuntu-cve.json
```

Create an evidence from this report:

```bash
valint bom ubuntu-cve.json --predicate-type http://scribesecurity.com/evidence/generic/v0.1  -o statement-generic
```

Edit the policy in the config object, within the rego code in file ```cve-policy.yml```:

```rego
config := {
  "cve_count_bar": 0,
  "cve_error_level":"error"
}

```

Verify the attestation against the policy:

```bash
valint verify ubuntu-cve.json -i statement-generic -c cve-policy.yml 
```

#### Generic SARIF policy

This policy allows to verify any SARIF report against a given policy. The policy has several parameters to check against:

* ruleLevel: the level of the rule, can be "error", "warning", "note", "none"
* ruleIds: the list of the rule IDs to check against
* precision: the precision of the check, can be "exact", "substring", "regex"
* ignore: the list of the rule IDs to ignore
* maxAllowed: the maximum number of violations allowed

These values can be changed in the `config` section in the `generic-sarif.rego` file.

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

##### No critical CVEs

To verify that the SARIF report does not contain any critical CVEs, set the following parameters in the `config` section in the `generic-sarif.rego` file:

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

To verify that the SARIF report does not contain more than 10 high CVEs, set the following parameters in the `config` section in the `generic-sarif.rego` file:

```rego
config := {
   "ruleLevel": ["high"],
   "precision": [],
   "ruleIDs": [],
   "ignore": [],
   "maxAllowed": 10
}
```

##### Do not allow specific CVEs

To verify that the SARIF report does not contain CVE-2021-1234 and CVE-2021-5678, set the following parameters in the `config` section in the `generic-sarif.rego` file:

```rego
config := {
   "ruleLevel": [],
   "precision": [],
   "ruleIDs": ["CVE-2021-1234", "CVE-2021-5678"],
   "ignore": [],
   "maxAllowed": 0
}
```

### SBOMs

#### Banned licenses

This policy verifies that the SBOM does not include licenses in the list of risky licenses.

Create an sbom attestation, for example:

```bash
valint bom ubuntu:latest -o statement-cyclonedx-json
```

Edit the list of the risky licenses in the config object, within the rego code in file ```banned-licenses.yml```:

```rego
config := {
  "blacklist": {"GPL", "MPL"},
  "blacklisted_limit" : 200
}
```

Verify the attestation against the policy:

```bash
valint verify ubuntu:latest -i statement-cyclonedx-json -c banned-licenses.yml
```

#### Blacklist packages

This policy verifies that an SBOM does not include packages in the list of risky packages.

If you have not created an SBOM yet, create an sbom attestation, for example:

```bash
valint bom ubuntu:latest -o statement-cyclonedx-json
```

Edit the list of the risky licenses in the config object, within the rego code in file ```blacklist-packages.yml```:

```rego
config := {
  "blacklist": ["pkg:npm/readable-stream@1.0.34", "pkg:npm/trim@1.0.1"],
  "blacklisted_limit":0
}

```

Verify the attestation against the policy:

```bash
valint verify ubuntu:latest -i statement-cyclonedx-json -c blacklist-packages.yml
```

#### Complete licenses

This policy verifies that every package in the SBOM has a license.

If you have not created an SBOM yet, create an sbom attestation, for example:

```bash
valint bom ubuntu:latest -o statement-cyclonedx-json
```

Verify the attestation against the policy:

```bash
valint verify ubuntu:latest -i statement-cyclonedx-json -c complete-licenses.yml
```

#### Fresh SBOM

This policy verifies that the SBOM is not older than a given number of days.

If you have not created an SBOM yet, create an sbom attestation, for example:

```bash
valint bom ubuntu:latest -o statement-cyclonedx-json
```

Edit the policy in the config object, within the rego code in file ```fresh-sbom.rego```:

```rego
config := {
    "max_days" : 30
}
```

Verify the attestation against the policy:

```bash
valint verify ubuntu:latest -i statement-cyclonedx-json -c fresh-sbom.yml
```

#### Required packages

This policy verifies that the SBOM includes packages from the list of required packages.

If you have not created an SBOM yet, create an sbom attestation, for example:

```bash
valint bom ubuntu:latest -o statement-cyclonedx-json
```

Edit the list of the required packages in the config object, within the rego code in file ```required-packages.yml```:

```rego
config := {
  "required_pkgs": ["pkg:npm/readable-stream@1.0.34", "pkg:npm/trim@1.0.1"],
  "violations_limit":0
}
```

The policy checks if there is a package listed in SBOM whose name contains the name of a required package as a substring. For example, if the package name is ```pkg:deb/ubuntu/bash@5.1-6ubuntu1?arch=amd64\u0026distro=ubuntu-22.04```, it will match any substring, like just ```bash``` or ```bash@5.1-6ubuntu1```.

Verify the attestation against the policy:

```bash
valint verify ubuntu:latest -i statement-cyclonedx-json -c required-packages.yml
```

#### Signed by

This policy verifies that the SBOM is signed and the signer identity equals to a given value.

If you have not created an SBOM yet, create an sbom attestation, for example:

```bash
valint bom ubuntu:latest -o attest
```

Edit policy parameters under ```attest.cocosign.policies.modules.input identity``` in the `signed-by.yml` file:

```yaml
identity:
  emails:
    - mikey@resilience-sec.com
```

Verify the attestation against the policy:

```bash
valint verify ubuntu:latest -i attest -c signed-by.yml
```

### SLSA

#### Builder name

This policy verifies that the builder name of the SLSA statement equals to a given value.

If you have not created an SLSA statement yet, create an SLSA statement, for example:

```bash
valint slsa ubuntu:latest -o statement
```

Edit policy parametersin `rego` code in the `builder.yml` file:

```rego
config := {
  "builderType": "local",
  "hostname": "builder1"
}
```

Verify the attestation against the policy:

```bash
valint verify ubuntu:latest -i statement-slsa -c builder.yml
```

## Writing policy files

The rego policies can be written either as snippets in the yml file, or as separate rego files. The advantage of using separate rego files is that one can enjoy the IDE support for rego, such as syntax highlighting and linting, and one can test the rego code more easily.

An example of such a rego file is give in the ```cve.rego``` file, that is consumed by the ```cve-policy-rego-file.yml``` configuraion file. To evaluate the policy:

```bash
valint verify ubuntu-cve.json -i statement-generic -c cve-policy-rego-file.yml
```
