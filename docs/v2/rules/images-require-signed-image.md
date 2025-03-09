# Rule: Require Signed Container Image

**ID**: `images-require-signed-image`  
**Source YAML**: `image-signed.yaml`  
**Rego File Path**: `image-signed.rego`  

**Labels**: Images, Blueprint

**Short Description**: Enforces that container images (target_type=container) are cryptographically signed.
Allows you to skip checks for certain images matching skip_regex, and optionally
ensures that the signer's identity matches specified emails or common-names.


## Evidence Requirements

```yaml
target_type: container
signed: false
filter-by:
- product
- target
content_body_type: cyclonedx-json
```
## Rule Parameters (`with`)

```yaml
skip_image_regex:
- .*alpine.*
identity:
  emails: []
  common-names: []
```
