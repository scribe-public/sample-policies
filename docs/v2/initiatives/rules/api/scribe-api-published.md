---
sidebar_label: Scribe Published Policy
title: Scribe Published Policy
---  
# Scribe Published Policy  
**Type:** Rule  
**ID:** `scribe-published-policy`  
**Uses:** `api/scribe-api-published@v2/rules`  
**Source:** [v2/rules/api/scribe-api-published.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/api/scribe-api-published.yaml)  
**Rego Source:** [scribe-api-published.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/api/scribe-api-published.rego)  
**Labels:** Scribe  

Verify image Scribe Publish flag is set for container image.

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

## Usage example

```yaml
uses: api/scribe-api-published@v2/rules
with:
  superset:
    published: true
```

## Mitigation  
Ensure that all critical or high severity vulnerabilities are addressed before delivering the product.


## Description  
This rule ensures that the product is published only after all critical or high severity vulnerabilities are addressed.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | cyclonedx-json |

## Input Definitions  
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| superset | object | False | The superset of CVEs to check for, including the following format {published: {flag: <bool>}} |

