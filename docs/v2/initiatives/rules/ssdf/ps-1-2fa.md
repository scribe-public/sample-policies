---
sidebar_label: Enforce 2FA
title: Enforce 2FA
---  
# Enforce 2FA  
**Type:** Rule  
**ID:** `PS.1.1`  
**Uses:** `ssdf/ps-1-2fa@v2/rules`  
**Source:** [v2/rules/ssdf/ps-1-2fa.yaml](https://github.com/scribe-public/sample-policies/v2/rules/ssdf/ps-1-2fa.yaml)  
**Labels:** SSDF  

PS.1 Require 2FA for accessing code


## Mitigation  
Enforces two-factor authentication (2FA) for organizational accounts, significantly reducing the risk of unauthorized access  through compromised credentials.


:::tip 
Rule Result will be set as 'open' if evidence is missing.  
::: 
:::tip 
Signed Evidence for this rule **IS NOT** required by default but is recommended.  
::: 
:::warning  
his rule requires evaluation with a target; without one, the rule will be **disabled**.  
::: 

## Description  
This rule verifies that two-factor authentication (2FA) is enabled for the organization by examining the provided evidence.
It checks the organization's details (retrieved from the SARIF or equivalent evidence) and compares the value of the 
`organization_details.two_factor_requirement_enabled` field against the expected value.

The rule iterates over the organization data in the evidence, and if the `two_factor_requirement_enabled` field does not match 
the desired value, a violation is recorded. This ensures that all organizational accounts enforce 2FA, providing an additional 
layer of security against unauthorized access.

**Evidence Requirements:**
- Evidence must include organization data with a field named `organization_details.two_factor_requirement_enabled`.
- The data should come from a trusted source (e.g., a GitHub organization scan).
- The evidence must clearly indicate whether 2FA is enabled.


## Rule Parameters (`with`)  
| Parameter | Default |
|-----------|---------|
| desired_value | False |
