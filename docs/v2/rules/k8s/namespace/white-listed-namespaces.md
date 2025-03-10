# Rule: Allowed Namespaces

**ID**: `k8s-namespace-white-listed-namespaces`  
**Source**: [v2/rules/k8s/namespace/white-listed-namespaces.yaml](scribe-public/sample-policies.git/v2/rules/k8s/namespace/white-listed-namespaces.yaml)  
**Rego File Path**: `white-listed-namespaces.rego`  

**Labels**: K8s, Namespace

**Short Description**: Verify only namespaces specified in the Allowed List are allowed within the cluster.

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
namespaces: []
```
