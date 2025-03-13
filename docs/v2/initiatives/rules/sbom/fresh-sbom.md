---
sidebar_label: Enforce SBOM Freshness
title: Enforce SBOM Freshness
---  
# Enforce SBOM Freshness  
**Type:** Rule  
**ID:** `fresh-sbom`  
**Uses:** `sbom/fresh-sbom@v2/rules`  
**Source:** [v2/rules/sbom/fresh-sbom.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/sbom/fresh-sbom.yaml)  
**Rego Source:** [fresh-sbom.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/sbom/fresh-sbom.rego)  
**Labels:** SBOM, Image, Git  

Verify the SBOM is not older than the specified duration.

:::note 
This rule requires SBOM. See [here](https://scribe-security.netlify.app/docs/valint/sbom) for more details.  
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
t  
::: 
:::note 
h  
::: 
:::note 
a  
::: 
:::note 
t  
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
S  
::: 
:::note 
B  
::: 
:::note 
O  
::: 
:::note 
M  
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
c  
::: 
:::note 
l  
::: 
:::note 
u  
::: 
:::note 
d  
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
a  
::: 
:::note 
   
::: 
:::note 
c  
::: 
:::note 
r  
::: 
:::note 
e  
::: 
:::note 
a  
::: 
:::note 
t  
::: 
:::note 
i  
::: 
:::note 
o  
::: 
:::note 
n  
::: 
:::note 
   
::: 
:::note 
d  
::: 
:::note 
a  
::: 
:::note 
t  
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
o  
::: 
:::note 
   
::: 
:::note 
v  
::: 
:::note 
e  
::: 
:::note 
r  
::: 
:::note 
i  
::: 
:::note 
f  
::: 
:::note 
y  
::: 
:::note 
   
::: 
:::note 
i  
::: 
:::note 
t  
::: 
:::note 
s  
::: 
:::note 
   
::: 
:::note 
f  
::: 
:::note 
r  
::: 
:::note 
e  
::: 
:::note 
s  
::: 
:::note 
h  
::: 
:::note 
n  
::: 
:::note 
e  
::: 
:::note 
s  
::: 
:::note 
s  
::: 
:::note 
.  
::: 
:::note 

  
::: 
:::note 

  
::: 
:::note 
*  
::: 
:::note 
*  
::: 
:::note 
I  
::: 
:::note 
n  
::: 
:::note 
p  
::: 
:::note 
u  
::: 
:::note 
t  
::: 
:::note 
   
::: 
:::note 
E  
::: 
:::note 
x  
::: 
:::note 
a  
::: 
:::note 
m  
::: 
:::note 
p  
::: 
:::note 
l  
::: 
:::note 
e  
::: 
:::note 
:  
::: 
:::note 
*  
::: 
:::note 
*  
::: 
:::note 

  
::: 
:::note 

  
::: 
:::note 
`  
::: 
:::note 
`  
::: 
:::note 
`  
::: 
:::note 
y  
::: 
:::note 
a  
::: 
:::note 
m  
::: 
:::note 
l  
::: 
:::note 

  
::: 
:::note 
-  
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
e  
::: 
:::note 
s  
::: 
:::note 
:  
::: 
:::note 
   
::: 
:::note 
s  
::: 
:::note 
b  
::: 
:::note 
o  
::: 
:::note 
m  
::: 
:::note 
/  
::: 
:::note 
f  
::: 
:::note 
r  
::: 
:::note 
e  
::: 
:::note 
s  
::: 
:::note 
h  
::: 
:::note 
-  
::: 
:::note 
s  
::: 
:::note 
b  
::: 
:::note 
o  
::: 
:::note 
m  
::: 
:::note 
@  
::: 
:::note 
v  
::: 
:::note 
2  
::: 
:::note 
/  
::: 
:::note 
r  
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
s  
::: 
:::note 

  
::: 
:::note 
   
::: 
:::note 
   
::: 
:::note 
w  
::: 
:::note 
i  
::: 
:::note 
t  
::: 
:::note 
h  
::: 
:::note 
:  
::: 
:::note 

  
::: 
:::note 
   
::: 
:::note 
   
::: 
:::note 
   
::: 
:::note 
   
::: 
:::note 
m  
::: 
:::note 
a  
::: 
:::note 
x  
::: 
:::note 
_  
::: 
:::note 
d  
::: 
:::note 
a  
::: 
:::note 
y  
::: 
:::note 
s  
::: 
:::note 
:  
::: 
:::note 
   
::: 
:::note 
3  
::: 
:::note 
0  
::: 
:::note 

  
::: 
:::note 
`  
::: 
:::note 
`  
::: 
:::note 
`  
::: 
:::note 

  
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

## Mitigation  
Ensures that the SBOM is up-to-date, reducing the risk of outdated information and ensuring accurate tracking of components.



## Description  
This rule inspects the CycloneDX SBOM evidence for the artifact to verify that it is not older than the specified duration.
It performs the following steps:

1. Checks the creation date of the SBOM.
2. Compares the creation date against the maximum allowed age specified in the `with.max_days` configuration.
   - If the SBOM is older than the allowed duration, the rule flags it as a violation.

**Evidence Requirements:**
- Evidence must be provided in the CycloneDX JSON format.
- The SBOM must include a creation date.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| filter-by | ['product', 'target'] |
| signed | False |
| content_body_type | cyclonedx-json |

## Input Definitions  
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| max_days | integer | False | The maximum allowed age of the SBOM in days. |

