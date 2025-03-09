# Rule: Prevent Long-Lived Tokens

**ID**: `bb-project-long-live-tokens`  
**Source YAML**: `long-live-tokens.yaml`  
**Rego File Path**: `long-live-tokens.rego`  

**Labels**: Bitbucket, Project

**Short Description**: Verify Bitbucket API tokens expire before the maximum time to live.

## Evidence Requirements

```yaml
signed: false
content_body_type: generic
predicate_type: http://scribesecurity.com/evidence/discovery/v0.1
labels:
- asset_type=project
- platform=bitbucket
- platform_instance=bitbucket_dc
```
## Rule Parameters (`with`)

```yaml
max_days: 30
```
