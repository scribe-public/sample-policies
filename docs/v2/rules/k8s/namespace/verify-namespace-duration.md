# Rule: Verify Namespace Runtime Duration

**ID**: `k8s-namespace-verify-namespace-duration`  
**Source YAML**: `verify-namespace-duration.yaml`  
**Rego File Path**: `verify-namespace-duration.rego`  

**Labels**: K8s, Namespace

**Short Description**: Verify Kubernetes namespaces adhere to a specified runtime duration to enforce lifecycle limits.

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
threshold_date: '1970-01-01T00:00:00Z'
```
