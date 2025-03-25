---
sidebar_label: Enforce 2FA
title: Enforce 2FA
---  
# Enforce 2FA  
**Type:** Rule  
**ID:** `PS.1.1`  
**Source:** [v2/rules/ssdf/ps-1-2fa.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/ssdf/ps-1-2fa.yaml)  
**Labels:** SSDF  

PS.1 Require 2FA for accessing code

:::note 
This rule requires Statement. See [here](https://deploy-preview-299--scribe-security.netlify.app/docs/valint/generic) for more details.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 

## Usage example

```yaml
uses: ssdf/ps-1-2fa@v2
```

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| desired_value | True |

