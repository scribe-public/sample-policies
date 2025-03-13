---
sidebar_label: Require Signed Container Image
title: Require Signed Container Image
---  
# Require Signed Container Image  
**Type:** Rule  
**ID:** `images-require-signed-image`  
**Uses:** `images/image-signed@v2/rules`  
**Source:** [v2/rules/images/image-signed.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/images/image-signed.yaml)  
**Rego Source:** [image-signed.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/images/image-signed.rego)  
**Labels:** Images, Blueprint  

Enforces that container images (target_type=container) are cryptographically signed.


:::note 
This rule requires Image SBOM. See [here](https://scribe-security.netlify.app/docs/valint/sbom) for more details.  
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
/  
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
-  
::: 
:::note 
s  
::: 
:::note 
i  
::: 
:::note 
g  
::: 
:::note 
n  
::: 
:::note 
e  
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
i  
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
t  
::: 
:::note 
i  
::: 
:::note 
t  
::: 
:::note 
y  
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
e  
::: 
:::note 
m  
::: 
:::note 
a  
::: 
:::note 
i  
::: 
:::note 
l  
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
b  
::: 
:::note 
o  
::: 
:::note 
b  
::: 
:::note 
@  
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
a  
::: 
:::note 
n  
::: 
:::note 
y  
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
a  
::: 
:::note 
l  
::: 
:::note 
i  
::: 
:::note 
c  
::: 
:::note 
e  
::: 
:::note 
@  
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
a  
::: 
:::note 
n  
::: 
:::note 
y  
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
s  
::: 
:::note 
k  
::: 
:::note 
i  
::: 
:::note 
p  
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
e  
::: 
:::note 
x  
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
-  
::: 
:::note 
   
::: 
:::note 
.  
::: 
:::note 
*  
::: 
:::note 
a  
::: 
:::note 
l  
::: 
:::note 
p  
::: 
:::note 
i  
::: 
:::note 
n  
::: 
:::note 
e  
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
Ensures that only container images with valid cryptographic signatures are deployed, mitigating the risk of tampering. By requiring evidence in the CycloneDX attest-cyclonedx-json format, this rule confirms that images have been signed by trusted entities.



## Description  
This rule evaluates the evidence for a container image to determine if it is properly signed. It checks the 
environment field in the evidence to verify that the `content_type` is set to "attest-cyclonedx-json". If the 
image name matches any pattern specified in `with.skip_image_regex`, the signature check is skipped, allowing flexibility 
for images that do not require a signature. Otherwise, if the evidence does not indicate a valid signature, the rule fails.

**Evidence Requirements:**

- Evidence must be provided in CycloneDX JSON format with a `content_body_type` of "cyclonedx-json".
- The evidence environment must include a `content_type` field that indicates the report is signed (i.e., "attest-cyclonedx-json").
- The `with.skip_image_regex` parameter allows specifying patterns (e.g., "alpine") to bypass the signature requirement for certain images. 


## Evidence Requirements  
| Field | Value |
|-------|-------|
| target_type | container |
| signed | False |
| filter-by | ['product', 'target'] |
| content_body_type | cyclonedx-json |

## Input Definitions  
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| identity | object | False | Identity information for the signers |
| skip_image_regex | array | False | Patterns to bypass the signature requirement for certain images |

