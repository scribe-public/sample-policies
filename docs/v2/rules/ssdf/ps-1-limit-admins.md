# Limit admins  
**Type:** Rule  
**ID:** `PS.1.3`  
**Uses:** `ssdf/ps-1-limit-admins@v2/rules`  
**Source:** [v2/rules/ssdf/ps-1-limit-admins.yaml](https://github.com/scribe-public/sample-policies/v2/rules/ssdf/ps-1-limit-admins.yaml)  
**Labels:** SSDF  

PS.1 Restrict the maximum number of organization admins


## Mitigation  
Limits the number of administrative accounts, minimizing the potential for abuse of elevated privileges.


> Evidence for this rule **IS NOT** required by default but is recommended.


## Rule Parameters (`with`)  
```yaml
max_admins: 3
```

