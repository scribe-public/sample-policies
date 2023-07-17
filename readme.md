# Sample Policies

This repo includes samples of policy configuraions for Scribe's ```valint``` tool.

## Preparation

Install valint:

```curl -sSfL https://get.scribesecurity.com/install.sh  | sh -s -- -t valint```

Clone this repo.

## SBOM License Policy

This policy verifies that the SBOM does not include licenses in the list of risky licenses. 

Create an sbom attestation, for example:
```valint bom kibana:8.6.2 -o statement-cyclonedx-json```

Edit the list of the risky licenses in the config object, within the rego code in file ```sbom-license-policy.yml```:

```rego
                  config := {
                    "blacklist": {"GPL", "MPL"},
                    "blacklisted_limit" : 200
                  }
```


Verify the attestation against the policy:
```valint verify kibana:8.6.2 -i statement-cyclonedx-json -c sbom-license-policy.yml```


## SBOM Packages Policy

This policy verifies that an SBOM does not include packages in the list of risky packages.

If you have not created before an SBOM for experiencing with the licenses policy, create an sbom attestation, for example:
```valint bom kibana:8.6.2 -o statement-cyclonedx-json```

Edit the list of the risky licenses in the config object, within the rego code in file ```sbom-packages-policy.yml```:

```json
                  config := {
                    "blacklist": ["pkg:npm/readable-stream@1.0.34", "pkg:npm/trim@1.0.1"],
                    "blacklisted_limit":0
                  }

```


Verify the attestation against the policy:
```valint verify kibana:8.6.2 -i statement-cyclonedx-json -c sbom-packages-policy.yml```

## Image CVE Policy

Create a trivy sarif report of the vulnerabilities of an image:
```trivy image kibana:8.6.2 -f sarif -o kibana-trivy.json```

Create an attestation from this report:
```valint bom kibana-trivy.json --predicate-type http://scribesecurity.com/evidence/generic/v0.1  -o statement-generic```

Edit the policy in the config object, within the rego code in file ```cve-policy.yml```:

```json
                  config := {
                    "cve_count_bar": 0,
                    "cve_error_level":"error"
                  }

```

Verify the attestation against the policy:
```valint verify kibana:8.6.2 -i statement-cyclonedx-json -c cve-policy.yml```

