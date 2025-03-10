# Rule: Allowed Pods in Namespace  
**ID:** `k8s-namespace-white-listed-pod`  
**Uses:** `k8s/namespace/white-listed-pod@v2/rules`  
**Source:** [v2/rules/k8s/namespace/white-listed-pod.yaml](https://github.com/scribe-public/sample-policies/v2/rules/k8s/namespace/white-listed-pod.yaml)  
**Rego Source:** [white-listed-pod.rego](https://github.com/scribe-public/sample-policies/v2/rules/k8s/namespace/white-listed-pod.rego)  
**Labels:** K8s, Namespace  

Verify only pods explicitly listed in the Allowed List run within a Kubernetes namespace.

> Evidence for this rule **IS NOT** required by default but is recommended.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | ['asset_type=namespace'] |

## Rule Parameters (`with`)  
```yaml
white_listed_pod: []
verify_namespaces:
- .*
```

