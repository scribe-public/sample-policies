---
sidebar_label: Require Specified SBOM Licenses
title: Require Specified SBOM Licenses
---  
# Require Specified SBOM Licenses  
**Type:** Rule  
**ID:** `sbom-hf-license`  
**Uses:** `sbom/verify-huggingface-license@v2/rules`  
**Source:** [v2/rules/sbom/verify-huggingface-license.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/sbom/verify-huggingface-license.yaml)  
**Rego Source:** [verify-hf-license.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/sbom/verify-hf-license.rego)  
**Labels:** SBOM, Image, Git  

Verify the artifact includes all specified licenses.

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
s  
::: 
:::note 
p  
::: 
:::note 
e  
::: 
:::note 
c  
::: 
:::note 
i  
::: 
:::note 
f  
::: 
:::note 
i  
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
n  
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
T  
::: 
:::note 
h  
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
   
::: 
:::note 
a  
::: 
:::note 
c  
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
H  
::: 
:::note 
u  
::: 
:::note 
g  
::: 
:::note 
g  
::: 
:::note 
i  
::: 
:::note 
n  
::: 
:::note 
g  
::: 
:::note 
   
::: 
:::note 
F  
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
v  
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
h  
::: 
:::note 
e  
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
c  
::: 
:::note 
e  
::: 
:::note 
n  
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
.  
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

## Usage example

```yaml
uses: sbom/verify-huggingface-license@v2/rules
with:
  licenses:
    - "MIT"
    - "Apache-2.0"
```

## Mitigation  
Ensures that all specified licenses are included in the SBOM, reducing the risk of legal issues and ensuring compliance with open-source licenses.



## Description  
This rule verifies that the artifact includes all specified licenses.
It performs the following steps:

1. Iterates over the dependencies listed in the SBOM.
2. Checks each dependency for the presence of the specified licenses in the `with.licenses` configuration.
   - If a specified license is missing, the rule flags it as a violation.
3. Accesses the Hugging Face API to validate the licenses.

**Evidence Requirements:**
- Evidence must be provided in the CycloneDX JSON format.
- The SBOM must include a list of dependencies with their licenses.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| filter-by | ['product', 'target'] |
| signed | False |
| content_body_type | cyclonedx-json |

## Input Definitions  
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| licenses | array | True | A list of specified licenses. |

