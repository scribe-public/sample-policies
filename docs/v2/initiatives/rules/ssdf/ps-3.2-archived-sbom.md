---
sidebar_label: SBOM archived
title: SBOM archived
---  
# SBOM archived  
**Type:** Rule  
**ID:** `PS.3.2`  
**Uses:** `ssdf/ps-3.2-archived-sbom@v2/rules`  
**Source:** [v2/rules/ssdf/ps-3.2-archived-sbom.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/ssdf/ps-3.2-archived-sbom.yaml)  
**Labels:** SSDF  

PS.3.2 Archive SBOM

:::note 
This rule requires [Statement](https://scribe-security.netlify.app/docs/valint/generic).  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 

## Mitigation  
Archives the SBOM for every build, providing a permanent record of the software components and their relationships, thereby reducing the risk of supply chain attacks.



