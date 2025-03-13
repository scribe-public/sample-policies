---
sidebar_label: Allowed Pods in Namespace
title: Allowed Pods in Namespace
---  
# Allowed Pods in Namespace  
**Type:** Rule  
**ID:** `k8s-namespace-white-listed-pod`  
**Uses:** `k8s/namespace/white-listed-pod@v2/rules`  
**Source:** [v2/rules/k8s/namespace/white-listed-pod.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/k8s/namespace/white-listed-pod.yaml)  
**Rego Source:** [white-listed-pod.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/k8s/namespace/white-listed-pod.rego)  
**Labels:** K8s, Namespace  

Verify only pods explicitly listed in the Allowed List run within a Kubernetes namespace.

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
_  
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
_  
::: 
:::note 
p  
::: 
:::note 
o  
::: 
:::note 
d  
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
p  
::: 
:::note 
o  
::: 
:::note 
d  
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
p  
::: 
:::note 
o  
::: 
:::note 
d  
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
_  
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
_  
::: 
:::note 
p  
::: 
:::note 
o  
::: 
:::note 
d  
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
m  
::: 
:::note 
y  
::: 
:::note 
-  
::: 
:::note 
p  
::: 
:::note 
o  
::: 
:::note 
d  
::: 
:::note 
-  
::: 
:::note 
1  
::: 
:::note 
.  
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
m  
::: 
:::note 
y  
::: 
:::note 
-  
::: 
:::note 
p  
::: 
:::note 
o  
::: 
:::note 
d  
::: 
:::note 
-  
::: 
:::note 
2  
::: 
:::note 
.  
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
Ensures that only approved pods are running within the Kubernetes namespace, reducing the risk of unauthorized or misconfigured pods.



## Description  
This rule ensures that only pods specified in the whitelist are allowed within the Kubernetes namespace.
It performs the following steps:

1. Iterates over the pods in the namespace.
2. Checks each pod against the whitelist specified in the `with.white_listed_pod` configuration.
   - If a pod is not in the whitelist, the rule flags it as a violation.

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
| white_listed_pod | array | True | A list of allowed pods (supports regex). |

