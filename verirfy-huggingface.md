# Verify ML Models

## Verifying Models and Datasets Integrity
Valint is Scribes cli tool for generating and validating attestations. Valint can be used to sign and verify ML datasets and models.

Example:
We want to use the HuggingFace model wtp-bert-tiny. In order to prevent compromising the model, we want to sign it, and verify it on use. This can be done with the following command:

```bash
valint bom git:https://huggingface.co/benjamin/wtp-bert-tiny -o attest
```

This command will create a signed attestation for the model’s repo. The attestation will be stored in an attestation store (in this case - a local folder) and will be signed (in this case - using Sigstore keyless signing).

A typical use of the model would be to clone the repo and use it’s files. Verifying the model’s integrity immediately after downloading can be done with the following commands:

```bash
git clone git:https://huggingface.co/benjamin/wtp-bert-tiny
valint verify git:wtp-bert-tiny
```

Verification of the model’s integrity before each use can be done with the following command:

```bash
valint verify git:wtp-bert-tiny
```

## Verify Models and Datasets License

Valint can also be used to verify the license of a model or dataset. This can be done with the following command:

```bash
valint verify git:wtp-bert-tiny -d att --rule v1/sboms/verify-huggingface-license@v1
```

where rule config is configured with parameters like:

```yaml
with:
  licenses:
    - "mit"
```

This policy extracts from the attestation the model id, pull from HuggingFace the model’s metadata, and verifies that the model’s license is "mit"

This command requieres the verify-hf-license.rego file.
