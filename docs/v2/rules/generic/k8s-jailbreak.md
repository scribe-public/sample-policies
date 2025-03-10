# Rule: K8s Jailbreak

**ID**: `k8s-jailbreak`  
**Source**: [v2/rules/generic/k8s-jailbreak.yaml](https://github.com/scribe-public/sample-policies/v2/rules/generic/k8s-jailbreak.yaml)  
**Rego File Path**: `k8s-jailbreak.rego`  

**Labels**: K8s

**Short Description**: Verify no misconfigurations from the prohibited ids list in the Kuberentes scan is below specified threshold

## Evidence Requirements

```yaml
signed: false
content_body_type: generic
predicate_type: http://docs.oasis-open.org/sarif/sarif/2.1.0
target_type: data
```
