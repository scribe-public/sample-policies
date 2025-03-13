---
sidebar_label: Enforce Allowed SBOM Components
title: Enforce Allowed SBOM Components
---  
# Enforce Allowed SBOM Components  
**Type:** Rule  
**ID:** `sbom-allowed-components`  
**Uses:** `sbom/allowed-components@v2/rules`  
**Source:** [v2/rules/sbom/allowed-components.yaml](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/sbom/allowed-components.yaml)  
**Rego Source:** [allowed-components.rego](https://github.com/scribe-public/sample-policies/blob/main/v2/rules/sbom/allowed-components.rego)  
**Labels:** SBOM, Image, Git  

Verify the artifact contains only allowed components.

:::note 
This rule requires SBOM. See [here](https://scribe-security.netlify.app/docs/valint/sbom) for more details.  
::: 
:::note 
C  
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
o  
::: 
:::note 
n  
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
   
::: 
:::note 
t  
::: 
:::note 
y  
::: 
:::note 
p  
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
f  
::: 
:::note 
e  
::: 
:::note 
r  
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
e  
::: 
:::note 
:  
::: 
:::note 
   
::: 
:::note 
h  
::: 
:::note 
t  
::: 
:::note 
t  
::: 
:::note 
p  
::: 
:::note 
s  
::: 
:::note 
:  
::: 
:::note 
/  
::: 
:::note 
/  
::: 
:::note 
c  
::: 
:::note 
y  
::: 
:::note 
c  
::: 
:::note 
l  
::: 
:::note 
o  
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
x  
::: 
:::note 
.  
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
d  
::: 
:::note 
o  
::: 
:::note 
c  
::: 
:::note 
s  
::: 
:::note 
/  
::: 
:::note 
1  
::: 
:::note 
.  
::: 
:::note 
6  
::: 
:::note 
/  
::: 
:::note 
j  
::: 
:::note 
s  
::: 
:::note 
o  
::: 
:::note 
n  
::: 
:::note 
/  
::: 
:::note 
#  
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
o  
::: 
:::note 
n  
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
_  
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
m  
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
y  
::: 
:::note 
p  
::: 
:::note 
e  
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
uses: sbom/allowed-components@v2/rules
with:
  types:
    - library
    - operating-system
```

## Mitigation  
Ensures that only approved components are included in the SBOM, reducing the risk of introducing vulnerabilities or unapproved dependencies into the software supply chain.



## Description  
This rule inspects the CycloneDX SBOM evidence for the artifact to verify that it contains only allowed components.
It performs the following steps:

1. Iterates over the components listed in the SBOM.
2. Checks each component's type against the allowed types specified in the `with.types` configuration.
3. Compares each component's name against the allowlist provided in the `with.allowlist` configuration.
   - If a component's type or name is not allowed, the rule flags it as a violation.

**Evidence Requirements:**
- Evidence must be provided in the CycloneDX JSON format.
- The SBOM must include a list of components with their types and names.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| filter-by | ['product', 'target'] |
| signed | False |
| content_body_type | cyclonedx-json |

## Input Definitions  
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| types | array | True | A list of allowed component types. |
| allowlist | array | True | A list of allowed components. |

