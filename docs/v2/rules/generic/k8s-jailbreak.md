# K8s Jailbreak  
**Type:** Rule  
**ID:** `k8s-jailbreak`  
**Uses:** `generic/k8s-jailbreak@v2/rules`  
**Source:** [v2/rules/generic/k8s-jailbreak.yaml](https://github.com/scribe-public/sample-policies/v2/rules/generic/k8s-jailbreak.yaml)  
**Rego Source:** [k8s-jailbreak.rego](https://github.com/scribe-public/sample-policies/v2/rules/generic/k8s-jailbreak.rego)  
**Labels:** K8s  

Verify no misconfigurations from the prohibited ids list in the Kuberentes scan is below specified threshold

> Rule Result will be set as 'open' if evidence is missing.  
> Signed Evidence for this rule **IS NOT** required by default but is recommended.  

## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| predicate_type | http://docs.oasis-open.org/sarif/sarif/2.1.0 |
| target_type | data |

