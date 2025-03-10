# Rule: Image-verifiable

**ID**: `PS.2`
**Source**: [v2/rules/ssdf/ps-2-image-verifiable.yaml](https://github.com/scribe-public/sample-policies/v2/rules/ssdf/ps-2-image-verifiable.yaml)
**Uses**: `ssdf/ps-2-image-verifiable@v2/rules

**Labels**: SSDF

**Short Description**: PS.2 Provide a mechanism to verify the integrity of the image

**Mitigation**:

Ensures container images are cryptographically verifiable, preventing tampering and confirming their authenticity.


## Evidence Requirements

```yaml
target_type: container
```
