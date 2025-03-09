# Rule: Blocklist Container User

**ID**: `images-blocklist-user`  
**Source YAML**: `blocklist-user.yaml`  
**Rego File Path**: `blocklist-user.rego`  

**Labels**: SBOM, Images

**Short Description**: Ensures that the container image does not use a user in the blocklist.
We look for a SBOM property named "user" in metadata.component.properties. 
If it matches any username from the 'users' list, we fail.


## Evidence Requirements

```yaml
signed: false
content_body_type: cyclonedx-json
target_type: container
```
## Rule Parameters (`with`)

```yaml
users: []
```
