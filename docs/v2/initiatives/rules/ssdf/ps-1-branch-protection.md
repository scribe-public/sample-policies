---
sidebar_label: Branch protected
title: Branch protected
---  
# Branch protected  
**Type:** Rule  
**ID:** `PS.1.2`  
**Uses:** `ssdf/ps-1-branch-protection@v2/rules`  
**Source:** [v2/rules/ssdf/ps-1-branch-protection.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/ssdf/ps-1-branch-protection.yaml)  
**Labels:** SSDF  

PS.1 Require branch protection for the repository

:::note 
This rule requires [Statement](https://scribe-security.netlify.app/docs/docs/valint/generic).  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 

## Mitigation  
Enforces branch protection policies to prevent unauthorized commits and maintain the integrity of critical code branches.



## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| desired_protected | True |

