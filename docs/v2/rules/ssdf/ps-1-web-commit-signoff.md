# Require signoff on web commits  
**Type:** Rule  
**ID:** `PS.1.5`  
**Uses:** `ssdf/ps-1-web-commit-signoff@v2/rules`  
**Source:** [v2/rules/ssdf/ps-1-web-commit-signoff.yaml](https://github.com/scribe-public/sample-policies/v2/rules/ssdf/ps-1-web-commit-signoff.yaml)  
**Labels:** SSDF  

PS.1 Require contributors to sign when committing to Github through the web interface


## Mitigation  
Requires signoff on web commits to ensure that code changes are reviewed and approved, thereby reducing the risk of unauthorized or malicious modifications.


> Rule Result will be set as 'open' if evidence is missing.  
> Signed Evidence for this rule **IS NOT** required by default but is recommended.  

## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| desired_value | True |
