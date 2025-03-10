# Rule: Allowed Namespaces  
**ID:** `k8s-namespace-white-listed-namespaces`  
**Uses:** `k8s/namespace/white-listed-namespaces@v2/rules`  
**Source:** [v2/rules/k8s/namespace/white-listed-namespaces.yaml](https://github.com/scribe-public/sample-policies/v2/rules/k8s/namespace/white-listed-namespaces.yaml)  
**Rego Source:** [white-listed-namespaces.rego](https://github.com/scribe-public/sample-policies/v2/rules/k8s/namespace/white-listed-namespaces.rego)  
**Short Description:** Verify only namespaces specified in the Allowed List are allowed within the cluster.  
**Labels:** K8s, Namespace  
> Evidence for this rule **IS NOT** required by default but is recommended


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
namespaces: []
```

