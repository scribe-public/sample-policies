# Rule: Allowed Pods

**ID**: `k8s-pods-white-listed-pod`  
**Source YAML**: `white-listed-pod.yaml`  
**Rego File Path**: `white-listed-pod.rego`  

**Labels**: K8s, Pod

**Short Description**: Verify only pods explicitly listed in the Allowed List are allowed to run.

## Evidence Requirements

```yaml
signed: false
content_body_type: generic
target_type: data
predicate_type: http://scribesecurity.com/evidence/discovery/v0.1
labels:
- asset_type=pod
```
## Rule Parameters (`with`)

```yaml
white_listed_pod: []
verify_namespaces:
- .*
```
