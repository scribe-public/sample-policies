# Rule: Verify Pod Termination  
**ID:** `k8s-pods-verify-pod-termination`  
**Uses:** `k8s/pods/verify-pod-termination@v2/rules`  
**Source:** [v2/rules/k8s/pods/verify-pod-termination.yaml](https://github.com/scribe-public/sample-policies/v2/rules/k8s/pods/verify-pod-termination.yaml)  
**Rego Source:** [verify-pod-termination.rego](https://github.com/scribe-public/sample-policies/v2/rules/k8s/pods/verify-pod-termination.rego)  
**Short Description:** Verify Kubernetes pods are properly terminated to prevent lingering resources and maintain cluster hygiene.  
**Labels:** K8s, Pod  

## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | ['asset_type=pod'] |

