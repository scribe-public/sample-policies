---
sidebar_label: Allowed Namespaces
title: Allowed Namespaces
---  
# Allowed Namespaces  
**Type:** Rule  
**ID:** `k8s-namespace-white-listed-namespaces`  
**Uses:** `k8s/namespace/white-listed-namespaces@v2/rules`  
**Source:** [v2/rules/k8s/namespace/white-listed-namespaces.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/k8s/namespace/white-listed-namespaces.yaml)  
**Rego Source:** [white-listed-namespaces.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/k8s/namespace/white-listed-namespaces.rego)  
**Labels:** K8s, Namespace  

Verify only namespaces specified in the Allowed List are allowed within the cluster.

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
s  
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
w  
::: 
:::note 
h  
::: 
:::note 
i  
::: 
:::note 
t  
::: 
:::note 
e  
::: 
:::note 
-  
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
e  
::: 
:::note 
d  
::: 
:::note 
-  
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
e  
::: 
:::note 
f  
::: 
:::note 
a  
::: 
:::note 
u  
::: 
:::note 
l  
::: 
:::note 
t  
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
k  
::: 
:::note 
u  
::: 
:::note 
b  
::: 
:::note 
e  
::: 
:::note 
-  
::: 
:::note 
s  
::: 
:::note 
y  
::: 
:::note 
s  
::: 
:::note 
t  
::: 
:::note 
e  
::: 
:::note 
m  
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
Ensures that only approved namespaces are allowed within the Kubernetes cluster, reducing the risk of unauthorized or misconfigured namespaces.



## Description  
This rule ensures that only namespaces specified in the whitelist are allowed within the Kubernetes cluster.
It performs the following steps:

1. Iterates over the namespaces in the cluster.
2. Checks each namespace against the whitelist specified in the `with.namespaces` configuration.
   - If a namespace is not in the whitelist, the rule flags it as a violation.

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
| namespaces | array | False | A list of allowed namespaces. |

