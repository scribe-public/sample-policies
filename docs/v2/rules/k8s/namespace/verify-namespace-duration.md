# Verify Namespace Runtime Duration  
**Type:** Rule  
**ID:** `k8s-namespace-verify-namespace-duration`  
**Uses:** `k8s/namespace/verify-namespace-duration@v2/rules`  
**Source:** [v2/rules/k8s/namespace/verify-namespace-duration.yaml](https://github.com/scribe-public/sample-policies/v2/rules/k8s/namespace/verify-namespace-duration.yaml)  
**Rego Source:** [verify-namespace-duration.rego](https://github.com/scribe-public/sample-policies/v2/rules/k8s/namespace/verify-namespace-duration.rego)  
**Labels:** K8s, Namespace  

Verify Kubernetes namespaces adhere to a specified runtime duration to enforce lifecycle limits.

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
threshold_date: '1970-01-01T00:00:00Z'
```

