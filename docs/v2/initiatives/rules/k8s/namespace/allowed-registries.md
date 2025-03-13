---
sidebar_label: Allowed Namespace Registries
title: Allowed Namespace Registries
---  
# Allowed Namespace Registries  
**Type:** Rule  
**ID:** `k8s-namespace-allowed-registries`  
**Uses:** `k8s/namespace/allowed-registries@v2/rules`  
**Source:** [v2/rules/k8s/namespace/allowed-registries.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/k8s/namespace/allowed-registries.yaml)  
**Rego Source:** [allowed-registries.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/k8s/namespace/allowed-registries.rego)  
**Labels:** K8s, Namespace  

Verify container images in Kubernetes namespaces originate from registries in the Allowed List.

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
r  
::: 
:::note 
e  
::: 
:::note 
g  
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
r  
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
_  
::: 
:::note 
r  
::: 
:::note 
e  
::: 
:::note 
g  
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
r  
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
*  
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
g  
::: 
:::note 
c  
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
*  
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
Ensures that only approved container registries are used within the Kubernetes namespace, reducing the risk of introducing vulnerabilities or unapproved software.



## Description  
This rule ensures that only container images from specified registries are allowed within the Kubernetes namespace.
It performs the following steps:

1. Iterates over the container images running in the namespace.
2. Checks each image's registry against the allowed registries specified in the `with.allowed_registries` configuration.
   - If an image's registry is not in the allowed list, the rule flags it as a violation.

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
| allowed_registries | array | False | A list of allowed container registries Regex patterns. |

