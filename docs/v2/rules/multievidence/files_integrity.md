# Rule: Verify File Integrity

**ID**: `file-integrity`  
**Source YAML**: `files_integrity.yaml`  
**Rego File Path**: `files_integrity.rego`  

**Labels**: SBOM

**Short Description**: Verify the checksum of each file in one SBOM matches the checksum in a second SBOM.

## Evidence Requirements

```yaml
signed: true
content_body_type: cyclonedx-json
target_type: container
labels:
- new_evidence
```
## Rule Parameters (`with`)

```yaml
ref_sbom: '{{ .Env.REF_SBOM_DATA }}'
path_prefix: pkg:file/
```
