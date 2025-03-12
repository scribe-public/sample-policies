# Verify Pod Runtime Duration  
**Type:** Rule  
**ID:** `k8s-pods-verify-pod-duration`  
**Uses:** `k8s/pods/verify-pod-duration@v2/rules`  
**Source:** [v2/rules/k8s/pods/verify-pod-duration.yaml](https://github.com/scribe-public/sample-policies/v2/rules/k8s/pods/verify-pod-duration.yaml)  
**Rego Source:** [verify-pod-duration.rego](https://github.com/scribe-public/sample-policies/v2/rules/k8s/pods/verify-pod-duration.rego)  
**Labels:** K8s, Pod  

Verify Kubernetes pods adhere to a specified runtime duration to enforce lifecycle limits.

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
| max_days | 30 |
