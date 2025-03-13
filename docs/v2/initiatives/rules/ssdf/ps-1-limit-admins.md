---
sidebar_label: Limit admins
title: Limit admins
---  
# Limit admins  
**Type:** Rule  
**ID:** `PS.1.3`  
**Uses:** `ssdf/ps-1-limit-admins@v2/rules`  
**Source:** [v2/rules/ssdf/ps-1-limit-admins.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/ssdf/ps-1-limit-admins.yaml)  
**Labels:** SSDF  

PS.1 Restrict the maximum number of organization admins

:::note 
This rule requires Statement. See [here](https://deploy-preview-299--scribe-security.netlify.app/valint/generic) for more details.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 

## Mitigation  
Limits the number of administrative accounts, minimizing the potential for abuse of elevated privileges.



## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| max_admins | 3 |

