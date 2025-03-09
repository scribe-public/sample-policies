# Rule: Allowed Namespace Registries

**ID**: `k8s-namespace-allowed-registries`  
**Source YAML**: `allowed-registries.yaml`  
**Rego File Path**: `allowed-registries.rego`  

**Labels**: K8s, Namespace

**Short Description**: Verify container images in Kubernetes namespaces originate from registries in the Allowed List.

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
allowed_registries: []
```
