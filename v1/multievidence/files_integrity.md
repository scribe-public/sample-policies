# Files Integrity Policy

This policy is an example of how can multievidence policy work.

This policy verifies that files referenced by an image sbom have the same checksums as in previous versions of the image sbom.

## Policy Configuration

This policy takes 2 arguments:

1. The reference SBOM
2. Path prefix to verify

It takes a target evidence and compares that all the components with the specified prefix have the same checksums as in the reference evidence.

```yaml
with:
  ref_sbom: '{{ .Args.REF_SBOM }}'
  path_prefix: "pkg:file/"
```

## Rule Evaluation

First, create the reference SBOM by running the following command:

```bash
valint bom busybox:latest -o attest -L baseline_dependencies -E -U $SCRIBE_CLIENT_ID -P $SCRIBE_CLIENT_SECRET
```

Then, at some point in time, create a new SBOM and run the following command:

```bash
```

Then, at some point in time, create a new SBOM and run the following command:

```bash
valint bom busybox:latest -o attest -L new_evidence -E -U $SCRIBE_CLIENT_ID -P $SCRIBE_CLIENT_SECRET
```

Before running `valint verify`, download the reference SBOM:

```bash
valint download busybox:latest --store scribe --format attest -L baseline_dependencies -O downloaded.json
```

And decode it to an environment variable:

```bash
export REF_SBOM_DATA=$(jq -r .Data downloaded.json | base64 -d | jq -r .payload | base64 -d | jq -r .payload)
```

Note that for an unsigned evidence (`statement`) the command is simplier:

```bash
export REF_SBOM_DATA=$(jq -r .Data downloaded.json | base64 -d)
```

Then, run the following command to verify the policy:

```bash
valint verify --rule policies/multievidence/files_integrity.yaml
```
