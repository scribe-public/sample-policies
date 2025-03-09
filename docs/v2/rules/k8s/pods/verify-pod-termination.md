# Rule: Verify Pod Termination

**ID**: `k8s-pods-verify-pod-termination`  
**Source YAML**: `verify-pod-termination.yaml`  
**Rego File Path**: `verify-pod-termination.rego`  

**Labels**: K8s, Pod

**Short Description**: Verify Kubernetes pods are properly terminated to prevent lingering resources and maintain cluster hygiene.

## Evidence Requirements

```yaml
signed: false
content_body_type: generic
target_type: data
predicate_type: http://scribesecurity.com/evidence/discovery/v0.1
labels:
- asset_type=pod
```
