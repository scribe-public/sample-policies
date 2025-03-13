---
sidebar_label: Enforce SBOM Dependencies
title: Enforce SBOM Dependencies
---  
# Enforce SBOM Dependencies  
**Type:** Rule  
**ID:** `sbom-required-dependencies`  
**Uses:** `sbom/required-packages@v2/rules`  
**Source:** [v2/rules/sbom/required-packages.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/sbom/required-packages.yaml)  
**Rego Source:** [required-packages.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/sbom/required-packages.rego)  
**Labels:** SBOM, Image  

Verify the artifact includes all required dependencies specified as a list of PURLs.

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
l  
::: 
:::note 
l  
::: 
:::note 
   
::: 
:::note 
r  
::: 
:::note 
e  
::: 
:::note 
q  
::: 
:::note 
u  
::: 
:::note 
i  
::: 
:::note 
r  
::: 
:::note 
e  
::: 
:::note 
d  
::: 
:::note 
   
::: 
:::note 
d  
::: 
:::note 
e  
::: 
:::note 
p  
::: 
:::note 
e  
::: 
:::note 
n  
::: 
:::note 
d  
::: 
:::note 
e  
::: 
:::note 
n  
::: 
:::note 
c  
::: 
:::note 
i  
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
t  
::: 
:::note 
o  
::: 
:::note 
   
::: 
:::note 
m  
::: 
:::note 
e  
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
c  
::: 
:::note 
o  
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
i  
::: 
:::note 
a  
::: 
:::note 
n  
::: 
:::note 
c  
::: 
:::note 
e  
::: 
:::note 
   
::: 
:::note 
r  
::: 
:::note 
e  
::: 
:::note 
q  
::: 
:::note 
u  
::: 
:::note 
i  
::: 
:::note 
r  
::: 
:::note 
e  
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
r  
::: 
:::note 
e  
::: 
:::note 
q  
::: 
:::note 
u  
::: 
:::note 
i  
::: 
:::note 
r  
::: 
:::note 
e  
::: 
:::note 
d  
::: 
:::note 
-  
::: 
:::note 
p  
::: 
:::note 
a  
::: 
:::note 
c  
::: 
:::note 
k  
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
s  
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
r  
::: 
:::note 
e  
::: 
:::note 
q  
::: 
:::note 
u  
::: 
:::note 
i  
::: 
:::note 
r  
::: 
:::note 
e  
::: 
:::note 
d  
::: 
:::note 
_  
::: 
:::note 
p  
::: 
:::note 
k  
::: 
:::note 
g  
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
-  
::: 
:::note 
   
::: 
:::note 
"  
::: 
:::note 
p  
::: 
:::note 
k  
::: 
:::note 
g  
::: 
:::note 
:  
::: 
:::note 
m  
::: 
:::note 
a  
::: 
:::note 
v  
::: 
:::note 
e  
::: 
:::note 
n  
::: 
:::note 
/  
::: 
:::note 
o  
::: 
:::note 
r  
::: 
:::note 
g  
::: 
:::note 
.  
::: 
:::note 
a  
::: 
:::note 
p  
::: 
:::note 
a  
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
.  
::: 
:::note 
c  
::: 
:::note 
o  
::: 
:::note 
m  
::: 
:::note 
m  
::: 
:::note 
o  
::: 
:::note 
n  
::: 
:::note 
s  
::: 
:::note 
/  
::: 
:::note 
c  
::: 
:::note 
o  
::: 
:::note 
m  
::: 
:::note 
m  
::: 
:::note 
o  
::: 
:::note 
n  
::: 
:::note 
s  
::: 
:::note 
-  
::: 
:::note 
l  
::: 
:::note 
a  
::: 
:::note 
n  
::: 
:::note 
g  
::: 
:::note 
3  
::: 
:::note 
@  
::: 
:::note 
3  
::: 
:::note 
.  
::: 
:::note 
9  
::: 
:::note 
"  
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
   
::: 
:::note 
   
::: 
:::note 
-  
::: 
:::note 
   
::: 
:::note 
"  
::: 
:::note 
p  
::: 
:::note 
k  
::: 
:::note 
g  
::: 
:::note 
:  
::: 
:::note 
n  
::: 
:::note 
p  
::: 
:::note 
m  
::: 
:::note 
/  
::: 
:::note 
l  
::: 
:::note 
o  
::: 
:::note 
d  
::: 
:::note 
a  
::: 
:::note 
s  
::: 
:::note 
h  
::: 
:::note 
@  
::: 
:::note 
4  
::: 
:::note 
.  
::: 
:::note 
1  
::: 
:::note 
7  
::: 
:::note 
.  
::: 
:::note 
1  
::: 
:::note 
5  
::: 
:::note 
"  
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
v  
::: 
:::note 
i  
::: 
:::note 
o  
::: 
:::note 
l  
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
s  
::: 
:::note 
_  
::: 
:::note 
l  
::: 
:::note 
i  
::: 
:::note 
m  
::: 
:::note 
i  
::: 
:::note 
t  
::: 
:::note 
:  
::: 
:::note 
   
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
Ensures that all required dependencies are included in the SBOM, reducing the risk of missing critical components and ensuring compliance with dependency requirements.



## Description  
This rule verifies that the artifact includes all required dependencies as specified.
It performs the following steps:

1. Iterates over the dependencies listed in the SBOM.
2. Checks each dependency against the required dependencies specified in the `with.required_pkgs` configuration.
   - If a required dependency is missing, the rule flags it as a violation.

**Evidence Requirements:**
- Evidence must be provided in the CycloneDX JSON format.
- The SBOM must include a list of dependencies.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| filter-by | ['product', 'target'] |
| signed | False |
| content_body_type | cyclonedx-json |

## Input Definitions  
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| required_pkgs | array | True | A list of required dependencies specified as PURLs. |
| violations_limit | integer | False | The maximum number of allowed violations. |

