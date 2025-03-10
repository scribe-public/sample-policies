# Rule: Verify Pod Runtime Duration

**ID**: `k8s-pods-verify-pod-duration`
**Source**: [v2/rules/k8s/pods/verify-pod-duration.yaml](https://github.com/scribe-public/sample-policies/v2/rules/k8s/pods/verify-pod-duration.yaml)
**Uses**: `k8s/pods/verify-pod-duration@v2/rules
**Rego Source**: [verify-pod-duration.rego](https://github.com/scribe-public/sample-policies/v2/rules/k8s/pods/verify-pod-duration.rego)

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
