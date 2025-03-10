# Rule: K8s Jailbreak  
**ID:** `k8s-jailbreak`  
**Uses:** `generic/k8s-jailbreak@v2/rules`  
**Source:** [v2/rules/generic/k8s-jailbreak.yaml](https://github.com/scribe-public/sample-policies/v2/rules/generic/k8s-jailbreak.yaml)  
**Rego Source:** [k8s-jailbreak.rego](https://github.com/scribe-public/sample-policies/v2/rules/generic/k8s-jailbreak.rego)  
**Short Description:** Verify no misconfigurations from the prohibited ids list in the Kuberentes scan is below specified threshold  
**Labels:** K8s  
> Evidence for this rule **IS NOT** required by default but is recommended


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| predicate_type | http://docs.oasis-open.org/sarif/sarif/2.1.0 |
| target_type | data |

