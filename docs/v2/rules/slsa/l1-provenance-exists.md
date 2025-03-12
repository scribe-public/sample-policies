# Verify Provenance Document Exists  
**Type:** Rule  
**ID:** `SLSA.L1`  
**Uses:** `slsa/l1-provenance-exists@v2/rules`  
**Source:** [v2/rules/slsa/l1-provenance-exists.yaml](https://github.com/scribe-public/sample-policies/v2/rules/slsa/l1-provenance-exists.yaml)  
**Rego Source:** [l1-provenance-exists.rego](https://github.com/scribe-public/sample-policies/v2/rules/slsa/l1-provenance-exists.rego)  
**Help:** https://slsa.dev/spec/v1.0/requirements  
**Labels:** SLSA  

Verify that the Provenance document evidence exists.


## Mitigation  
Recording comprehensive provenance metadata allows organizations to verify the integrity of the build process and ensures that only authorized and untampered artifacts are deployed.

:::tip 
> Evidence **IS** required for this rule and will fail if missing.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
his rule requires evaluation with a target; without one, the rule will be **disabled**.  
::: 
:::info  
This rule scoped by product and target.  
:::  

## Evidence Requirements  
| Field | Value |
|-------|-------|
| filter-by | ['product', 'target'] |
| signed | False |
| content_body_type | slsa |

