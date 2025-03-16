---
sidebar_label: Code archived
title: Code archived
---  
# Code archived  
**Type:** Rule  
**ID:** `PS.3.1`  
**Uses:** `ssdf/ps-3.1-code-archived@v2/rules`  
**Source:** [v2/rules/ssdf/ps-3.1-code-archived.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/ssdf/ps-3.1-code-archived.yaml)  
**Labels:** SSDF  

PS.3.1 Verify that the software release data is archived.
We assume running in Github thus the code is allways stored in a repository


:::note 
This rule requires Statement. See [here](https://deploy-preview-299--scribe-security.netlify.app/docs/valint/generic) for more details.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 

## Mitigation  
Archives code changes to maintain a secure, immutable history for auditing and traceability.



## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| allow | True |
| short_description | Code is archived. |
| description | Since the code is within a repository, it is archived. |
| reason | The code is archived in a repository. This is a demo rule, planned to run from a workflow in a repository. |

