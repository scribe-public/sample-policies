# Verify File Integrity  
**Type:** Rule  
**ID:** `file-integrity`  
**Uses:** `multievidence/files_integrity@v2/rules`  
**Source:** [v2/rules/multievidence/files_integrity.yaml](https://github.com/scribe-public/sample-policies/v2/rules/multievidence/files_integrity.yaml)  
**Rego Source:** [files_integrity.rego](https://github.com/scribe-public/sample-policies/v2/rules/multievidence/files_integrity.rego)  
**Labels:** SBOM  

Verify the checksum of each file in one SBOM matches the checksum in a second SBOM.

> Evidence for this rule **IS* required by default.**


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | True |
| content_body_type | cyclonedx-json |
| target_type | container |
| labels | - new_evidence |

## Rule Parameters (`with`)  
```yaml
ref_sbom: '{{ .Env.REF_SBOM_DATA }}'
path_prefix: pkg:file/
```

