# Sample Policies

This repo includes samples of policy configuraions for Scribe's ```valint``` tool.

## Preparation

Install valint:

```bash
curl -sSfL https://get.scribesecurity.com/install.sh  | sh -s -- -t valint
```

Clone this repo.

## Policy catalogue

The following policies are included in this repo:

* [SBOM License Policy](#sbom-license-policy)
* [SBOM Packages Policy](#sbom-packages-policy)
* [Image CVE Policy](#image-cve-policy)
* [Max SBOM Age Policy](#max-sbom-age-policy)
* [Max Image Age Policy](#max-image-age-policy)

### SBOM License Policy

This policy verifies that the SBOM does not include licenses in the list of risky licenses. 

Create an sbom attestation, for example:
```bash
valint bom ubuntu:latest -o statement-cyclonedx-json
```

Edit the list of the risky licenses in the config object, within the rego code in file ```sbom-license-policy.yml```:

```rego
                  config := {
                    "blacklist": {"GPL", "MPL"},
                    "blacklisted_limit" : 200
                  }
```


Verify the attestation against the policy:
```bash
valint verify ubuntu:latest -i statement-cyclonedx-json -c sbom-license-policy.yml
```


### SBOM Packages Policy

This policy verifies that an SBOM does not include packages in the list of risky packages.

If you have not created before an SBOM for experiencing with the licenses policy, create an sbom attestation, for example:
```bash
valint bom ubuntu:latest -o statement-cyclonedx-json
```

Edit the list of the risky licenses in the config object, within the rego code in file ```sbom-packages-policy.yml```:

```rego
                  config := {
                    "blacklist": ["pkg:npm/readable-stream@1.0.34", "pkg:npm/trim@1.0.1"],
                    "blacklisted_limit":0
                  }

```


Verify the attestation against the policy:
```bash
valint verify ubuntu:latest -i statement-cyclonedx-json -c sbom-packages-policy.yml
```

### Image CVE Policy

Create a trivy sarif report of the vulnerabilities of an image:
```bash
trivy image ubuntu:latest -f sarif -o ubuntu-cve.json
```

Create an attestation from this report:
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

### Max SBOM Age Policy

This policy verifies that the SBOM is not older than a given number of days.

If you have not created before an SBOM for experiencing with the licenses policy, create an sbom attestation, for example:
```bash
valint bom ubuntu:latest -o statement-cyclonedx-json
```

Edit the policy in the config object, within the rego code in file ```max-sbom-age.rego```:

```rego
config := {
    "max_days" : 30
}
```

Verify the attestation against the policy:
```bash
valint verify ubuntu:latest -i statement-cyclonedx-json -c max-sbom-age.yml
```

### Max Image Age Policy

This policy verifies that the image is not older than a given number of days.

If you have not created before an SBOM for experiencing with the licenses policy, create an sbom attestation, for example:
```bash
valint bom ubuntu:latest -o statement-cyclonedx-json
```

Edit the policy in the config object, within the rego code in file ```max-image-age.rego```:

```rego
config := {
    "max_days" : 183
}
```

Verify the attestation against the policy:
```bash
valint verify ubuntu:latest -i statement-cyclonedx-json -c max-image-age.yml
```

## Writing policy files

The rego policies can be written either as snippets in the yml file, or as separate rego files. The advantage of using separate rego files is that one can enjoy the IDE support for rego, such as syntax highlighting and linting, and one can test the rego code more easily.

An example of such a rego file is give in the ```cve.rego``` file, that is consumed by the ```cve-policy-rego-file.yml``` configuraion file. To evaluate the policy:
```bash
valint verify ubuntu-cve.json -i statement-generic -c cve-policy-rego-file.yml
```
