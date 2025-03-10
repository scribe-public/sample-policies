# Rule: Verify File Integrity

**ID**: `file-integrity`  
**Uses**: `multievidence/files_integrity@v2/rules  
**Source**: [v2/rules/multievidence/files_integrity.yaml](https://github.com/scribe-public/sample-policies/v2/rules/multievidence/files_integrity.yaml)  
**Rego Source**: [files_integrity.rego](https://github.com/scribe-public/sample-policies/v2/rules/multievidence/files_integrity.rego)  
**Short Description**: Verify the checksum of each file in one SBOM matches the checksum in a second SBOM.  
**Labels**: SBOM

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
