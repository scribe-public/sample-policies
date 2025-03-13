---
sidebar_label: Repo private
title: Repo private
---  
# Repo private  
**Type:** Rule  
**ID:** `PS.1.4`  
**Uses:** `ssdf/ps-1-repo-private@v2/rules`  
**Source:** [v2/rules/ssdf/ps-1-repo-private.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/ssdf/ps-1-repo-private.yaml)  
**Labels:** SSDF  

PS.1 Assure the repository is private

:::note 
This rule requires Statement. See [here](https://scribe-security.netlify.app/docs/valint/generic) for more details.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 

## Mitigation  
Ensures that repositories remain private, reducing the risk of sensitive code being exposed to unauthorized parties.



## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| desired_value | True |

