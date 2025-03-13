---
sidebar_label: Allowed Container Images
title: Allowed Container Images
---  
# Allowed Container Images  
**Type:** Rule  
**ID:** `k8s-namespace-blocked-images`  
**Uses:** `k8s/namespace/allowed-images@v2/rules`  
**Source:** [v2/rules/k8s/namespace/allowed-images.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/k8s/namespace/allowed-images.yaml)  
**Rego Source:** [blocked-images.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/k8s/namespace/blocked-images.rego)  
**Labels:** K8s, Namespace  

Verify only container images specified in the Allowed List run within the Kubernetes namespace.

:::note 
This rule requires K8s Namespace Discovery Evidence. See [here](https://scribe-security.netlify.app/docs/platforms/discover#k8s-discovery) for more details.  
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
*  
::: 
:::note 
*  
::: 
:::note 

  
::: 
:::note 
`  
::: 
:::note 
i  
::: 
:::note 
m  
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
_  
::: 
:::note 
t  
::: 
:::note 
o  
::: 
:::note 
_  
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
`  
::: 
:::note 
   
::: 
:::note 
i  
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
l  
::: 
:::note 
i  
::: 
:::note 
s  
::: 
:::note 
t  
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
i  
::: 
:::note 
m  
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
r  
::: 
:::note 
e  
::: 
:::note 
p  
::: 
:::note 
o  
::: 
:::note 
s  
::: 
:::note 
i  
::: 
:::note 
t  
::: 
:::note 
o  
::: 
:::note 
r  
::: 
:::note 
y  
::: 
:::note 
   
::: 
:::note 
n  
::: 
:::note 
a  
::: 
:::note 
m  
::: 
:::note 
e  
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
k  
::: 
:::note 
8  
::: 
:::note 
s  
::: 
:::note 
/  
::: 
:::note 
n  
::: 
:::note 
a  
::: 
:::note 
m  
::: 
:::note 
e  
::: 
:::note 
s  
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
e  
::: 
:::note 
/  
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
o  
::: 
:::note 
w  
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
i  
::: 
:::note 
m  
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
i  
::: 
:::note 
m  
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
_  
::: 
:::note 
t  
::: 
:::note 
o  
::: 
:::note 
_  
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
d  
::: 
:::note 
o  
::: 
:::note 
c  
::: 
:::note 
k  
::: 
:::note 
e  
::: 
:::note 
r  
::: 
:::note 
.  
::: 
:::note 
i  
::: 
:::note 
o  
::: 
:::note 
/  
::: 
:::note 
m  
::: 
:::note 
y  
::: 
:::note 
_  
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
/  
::: 
:::note 
m  
::: 
:::note 
y  
::: 
:::note 
_  
::: 
:::note 
i  
::: 
:::note 
m  
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
1  
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
d  
::: 
:::note 
o  
::: 
:::note 
c  
::: 
:::note 
k  
::: 
:::note 
e  
::: 
:::note 
r  
::: 
:::note 
.  
::: 
:::note 
i  
::: 
:::note 
o  
::: 
:::note 
/  
::: 
:::note 
m  
::: 
:::note 
y  
::: 
:::note 
_  
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
/  
::: 
:::note 
m  
::: 
:::note 
y  
::: 
:::note 
_  
::: 
:::note 
i  
::: 
:::note 
m  
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
2  
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

## Mitigation  
Ensures that only approved container images are running within the Kubernetes namespace, reducing the risk of introducing vulnerabilities or unapproved software.


## Description  
This rule ensures that only container images specified in the allowed list are running within the Kubernetes namespace.
It performs the following steps:

1. Iterates over the container images running in the namespace.
2. Checks each image against the allowed list specified in the `with.images_to_include` configuration.
   - If an image is not in the allowed list, the rule flags it as a violation.

**Evidence Requirements:**
- Evidence must be provided by the Scribe Platform's CLI tool through scanning Kubernetes resources.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | - asset_type=namespace<br/>- platform=k8s |

## Input Definitions  
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| images_to_include | array | False | List of allowed container images. |

