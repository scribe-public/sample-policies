# Rule: Verify Namespace Termination

**ID**: `k8s-namespace-verify-namespace-termination`
**Source**: [v2/rules/k8s/namespace/verify-namespace-termination.yaml](https://github.com/scribe-public/sample-policies/v2/rules/k8s/namespace/verify-namespace-termination.yaml)
**Uses**: `k8s/namespace/verify-namespace-termination@v2/rules
**Rego Source**: [verify-namespace-termination.rego](https://github.com/scribe-public/sample-policies/v2/rules/k8s/namespace/verify-namespace-termination.rego)

**Labels**: K8s, Namespace

**Short Description**: Verify Kubernetes namespaces are properly terminated to prevent lingering resources and maintain cluster hygiene.

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
namespaces:
- .*
```
