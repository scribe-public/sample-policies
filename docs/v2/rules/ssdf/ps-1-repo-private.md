---
sidebar_label: Repo private
title: Repo private
---  
# Repo private  
**Type:** Rule  
**ID:** `PS.1.4`  
**Uses:** `ssdf/ps-1-repo-private@v2/rules`  
**Source:** [v2/rules/ssdf/ps-1-repo-private.yaml](https://github.com/scribe-public/sample-policies/v2/rules/ssdf/ps-1-repo-private.yaml)  
**Labels:** SSDF  

PS.1 Assure the repository is private


## Mitigation  
Ensures that repositories remain private, reducing the risk of sensitive code being exposed to unauthorized parties.


:::tip 
Rule Result will be set as 'open' if evidence is missing.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
his rule requires evaluation with a target; without one, the rule will be **disabled**.  
::: 

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| desired_value | True |
