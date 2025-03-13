---
sidebar_label: Verify Namespace Termination
title: Verify Namespace Termination
---  
# Verify Namespace Termination  
**Type:** Rule  
**ID:** `k8s-namespace-verify-namespace-termination`  
**Uses:** `k8s/namespace/verify-namespace-termination@v2/rules`  
**Source:** [v2/rules/k8s/namespace/verify-namespace-termination.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/k8s/namespace/verify-namespace-termination.yaml)  
**Rego Source:** [verify-namespace-termination.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/k8s/namespace/verify-namespace-termination.rego)  
**Labels:** K8s, Namespace  

Verify Kubernetes namespaces are properly terminated to prevent lingering resources and maintain cluster hygiene.

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
-  
::: 
:::note 
t  
::: 
:::note 
e  
::: 
:::note 
r  
::: 
:::note 
m  
::: 
:::note 
i  
::: 
:::note 
n  
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
"  
::: 
:::note 
.  
::: 
:::note 
*  
::: 
:::note 
"  
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
Ensures that namespaces are terminated in a timely manner, preventing lingering resources and maintaining cluster hygiene.



## Description  
This rule verifies that namespaces in Kubernetes are terminated properly within the specified time frame.
It performs the following steps:

1. Iterates over the namespaces marked for termination in the cluster.
2. Checks each namespace's termination time against the limit specified in the `with.max_termination_time` configuration.
   - If a namespace's termination time exceeds the limit, the rule flags it as a violation.

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
| namespaces | array | False | A list of namespaces to verify (supports regex). |

