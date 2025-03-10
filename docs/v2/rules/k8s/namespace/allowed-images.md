# Allowed Container Images  
**Type:** Rule  
**ID:** `k8s-namespace-blocked-images`  
**Uses:** `k8s/namespace/allowed-images@v2/rules`  
**Source:** [v2/rules/k8s/namespace/allowed-images.yaml](https://github.com/scribe-public/sample-policies/v2/rules/k8s/namespace/allowed-images.yaml)  
**Rego Source:** [blocked-images.rego](https://github.com/scribe-public/sample-policies/v2/rules/k8s/namespace/blocked-images.rego)  
**Labels:** K8s, Namespace  

Verify only container images specified in the Allowed List run within the Kubernetes namespace.

> Evidence for this rule **IS NOT** required by default but is recommended.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | - asset_type=namespace |

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| images_to_include | [] |
