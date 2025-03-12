# Allowed Pods  
**Type:** Rule  
**ID:** `k8s-pods-white-listed-pod`  
**Uses:** `k8s/pods/white-listed-pod@v2/rules`  
**Source:** [v2/rules/k8s/pods/white-listed-pod.yaml](https://github.com/scribe-public/sample-policies/v2/rules/k8s/pods/white-listed-pod.yaml)  
**Rego Source:** [white-listed-pod.rego](https://github.com/scribe-public/sample-policies/v2/rules/k8s/pods/white-listed-pod.rego)  
**Labels:** K8s, Pod  

Verify only pods explicitly listed in the Allowed List are allowed to run.

:::tip 
Rule Result will be set as 'open' if evidence is missing.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
his rule requires evaluation with a target; without one, the rule will be **disabled**.  
::: 

## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | - asset_type=pod |

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| white_listed_pod | [] |
| verify_namespaces | ['.*'] |
