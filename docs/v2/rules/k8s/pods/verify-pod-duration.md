# Rule: Verify Pod Runtime Duration

**ID**: `k8s-pods-verify-pod-duration`  
**Source**: [v2/rules/k8s/pods/verify-pod-duration.yaml](scribe-public/sample-policies.git/v2/rules/k8s/pods/verify-pod-duration.yaml)  
**Rego File Path**: `verify-pod-duration.rego`  

**Labels**: K8s, Pod

**Short Description**: Verify Kubernetes pods adhere to a specified runtime duration to enforce lifecycle limits.

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
max_days: '30'
```
