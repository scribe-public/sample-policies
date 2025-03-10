# Rule: Allowed Container Images

**ID**: `k8s-namespace-blocked-images`  
**Uses**: `k8s/namespace/allowed-images@v2/rules  
**Source**: [v2/rules/k8s/namespace/allowed-images.yaml](https://github.com/scribe-public/sample-policies/v2/rules/k8s/namespace/allowed-images.yaml)  
**Rego Source**: [blocked-images.rego](https://github.com/scribe-public/sample-policies/v2/rules/k8s/namespace/blocked-images.rego)  
**Short Description**: Verify only container images specified in the Allowed List run within the Kubernetes namespace.  
**Labels**: K8s, Namespace

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
images_to_include: []
```
