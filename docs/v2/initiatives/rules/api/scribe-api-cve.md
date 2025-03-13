---
sidebar_label: Verify No Critical or High Vulnerabilities
title: Verify No Critical or High Vulnerabilities
---  
# Verify No Critical or High Vulnerabilities  
**Type:** Rule  
**ID:** `scribe-cve`  
**Uses:** `api/scribe-api-cve@v2/rules`  
**Source:** [v2/rules/api/scribe-api-cve.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/api/scribe-api-cve.yaml)  
**Rego Source:** [scribe-api.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/api/scribe-api.rego)  
**Labels:** SCA, Blueprint, Scribe  

Verify via Scribe API that there no critical or high severity vulnerabilities in the target artifact (container image, folder, etc.).

:::note 
R  
::: 
:::note 
u  
::: 
:::note 
l  
::: 
:::note 
e  
::: 
:::note 
   
::: 
:::note 
U  
::: 
:::note 
s  
::: 
:::note 
e  
::: 
:::note 
s  
::: 
:::note 
   
::: 
:::note 
S  
::: 
:::note 
c  
::: 
:::note 
r  
::: 
:::note 
i  
::: 
:::note 
b  
::: 
:::note 
e  
::: 
:::note 
   
::: 
:::note 
A  
::: 
:::note 
P  
::: 
:::note 
I  
::: 
:::note 
   
::: 
:::note 
t  
::: 
:::note 
o  
::: 
:::note 
   
::: 
:::note 
c  
::: 
:::note 
h  
::: 
:::note 
e  
::: 
:::note 
c  
::: 
:::note 
k  
::: 
:::note 
   
::: 
:::note 
f  
::: 
:::note 
o  
::: 
:::note 
r  
::: 
:::note 
   
::: 
:::note 
C  
::: 
:::note 
V  
::: 
:::note 
E  
::: 
:::note 
s  
::: 
:::note 
   
::: 
:::note 
i  
::: 
:::note 
n  
::: 
:::note 
   
::: 
:::note 
t  
::: 
:::note 
h  
::: 
:::note 
e  
::: 
:::note 
   
::: 
:::note 
t  
::: 
:::note 
a  
::: 
:::note 
r  
::: 
:::note 
g  
::: 
:::note 
e  
::: 
:::note 
t  
::: 
:::note 
   
::: 
:::note 
a  
::: 
:::note 
r  
::: 
:::note 
t  
::: 
:::note 
i  
::: 
:::note 
f  
::: 
:::note 
a  
::: 
:::note 
c  
::: 
:::note 
t  
::: 
:::note 
,  
::: 
:::note 
   
::: 
:::note 
E  
::: 
:::note 
n  
::: 
:::note 
s  
::: 
:::note 
u  
::: 
:::note 
r  
::: 
:::note 
e  
::: 
:::note 
   
::: 
:::note 
u  
::: 
:::note 
s  
::: 
:::note 
a  
::: 
:::note 
g  
::: 
:::note 
e  
::: 
:::note 
   
::: 
:::note 
o  
::: 
:::note 
f  
::: 
:::note 
   
::: 
:::note 
S  
::: 
:::note 
c  
::: 
:::note 
r  
::: 
:::note 
i  
::: 
:::note 
b  
::: 
:::note 
e  
::: 
:::note 
   
::: 
:::note 
T  
::: 
:::note 
o  
::: 
:::note 
k  
::: 
:::note 
e  
::: 
:::note 
n  
::: 
:::note 
   
::: 
:::note 
i  
::: 
:::note 
n  
::: 
:::note 
   
::: 
:::note 
t  
::: 
:::note 
h  
::: 
:::note 
e  
::: 
:::note 
   
::: 
:::note 
e  
::: 
:::note 
n  
::: 
:::note 
v  
::: 
:::note 
i  
::: 
:::note 
r  
::: 
:::note 
o  
::: 
:::note 
n  
::: 
:::note 
m  
::: 
:::note 
e  
::: 
:::note 
n  
::: 
:::note 
t  
::: 
:::note 
.  
::: 
:::note 

  
::: 
:::tip 
Rule requires the Scribe API to be enabled.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
::: 
:::info  
Rule is scoped by product and target.  
:::  

## Usage example

```yaml
uses: api/scribe-api-cve@v2/rules
with:
  superset:
    cve:
      max: 0
      severity: 6
```

## Mitigation  
Ensure that all critical or high severity vulnerabilities are addressed before delivering the product.


## Description  
This rule ensures that there are no critical or high severity vulnerabilities in any deliverable component of the product by verifying via the Scribe API.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| filter-by | ['product', 'target'] |
| signed | False |
| content_body_type | cyclonedx-json |
| target_type | container |

## Input Definitions  
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| superset | object | False | The superset of CVEs to check for, including the following format {cve: {max: <int>, severity: <int}} |

