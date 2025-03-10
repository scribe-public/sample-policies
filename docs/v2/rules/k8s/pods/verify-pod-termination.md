# Rule: Verify Pod Termination

**ID**: `k8s-pods-verify-pod-termination`
**Source**: [v2/rules/k8s/pods/verify-pod-termination.yaml](https://github.com/scribe-public/sample-policies/v2/rules/k8s/pods/verify-pod-termination.yaml)
**Uses**: `k8s/pods/verify-pod-termination@v2/rules
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
