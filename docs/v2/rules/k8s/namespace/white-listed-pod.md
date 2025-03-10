# Rule: Allowed Pods in Namespace

**ID**: `k8s-namespace-white-listed-pod`  
**Source**: [v2/rules/k8s/namespace/white-listed-pod.yaml](https://github.com/scribe-public/sample-policies/v2/rules/k8s/namespace/white-listed-pod.yaml)  
**Rego File Path**: `white-listed-pod.rego`  

**Labels**: K8s, Namespace

**Short Description**: Verify only pods explicitly listed in the Allowed List run within a Kubernetes namespace.

## Evidence Requirements

```yaml
signed: false
content_body_type: generic
target_type: data
predicate_type: http://scribesecurity.com/evidence/discovery/v0.1
labels:
- asset_type=namespace
```
## Rule Parameters (`with`)

```yaml
white_listed_pod: []
verify_namespaces:
- .*
```
