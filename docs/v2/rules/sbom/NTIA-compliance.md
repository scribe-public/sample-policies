# Rule: NTIA SBOM Compliance Check

**ID**: `NTIA-compliance`  
**Source YAML**: `NTIA-compliance.yaml`  
**Rego File Path**: `NTIA-compliance.rego`  

**Labels**: SBOM, Compliance

**Short Description**: Validates that SBOM metadata meets basic NTIA requirements for authors and supplier.
Checks that:
  1) Authors exist, are non-empty, and each author has both a name and email.
  2) Supplier exists with non-empty name, url, and contact. At least one contact has non-empty email.
  3) Optionally enforces a required author (case-insensitive match for name/email).
  4) Optionally enforces a required supplier (case-insensitive match for supplier name).


## Evidence Requirements

```yaml
signed: false
content_body_type: cyclonedx-json
target_type: container
```
## Rule Parameters (`with`)

```yaml
required_author: {}
required_supplier: {}
```
