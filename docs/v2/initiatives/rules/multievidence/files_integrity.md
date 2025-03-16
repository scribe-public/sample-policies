---
sidebar_label: Verify File Integrity
title: Verify File Integrity
---  
# Verify File Integrity  
**Type:** Rule  
**ID:** `file-integrity`  
**Source:** [v2/rules/multievidence/files_integrity.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/multievidence/files_integrity.yaml)  
**Rego Source:** [files_integrity.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/multievidence/files_integrity.rego)  
**Labels:** SBOM  

Verify the checksum of each file in one SBOM matches the checksum in a second SBOM.

:::note 
This rule requires Signed Image SBOM. See [here](https://deploy-preview-299--scribe-security.netlify.app/docs/valint/sbom) for more details.  
::: 
:::tip 
Signed Evidence for this rule **IS** required by default.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 

## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | True |
| content_body_type | cyclonedx-json |
| target_type | container |
| labels | - new_evidence |

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| ref_sbom | `{{ .Env.REF_SBOM_DATA }}` |
| path_prefix | pkg:file/ |

