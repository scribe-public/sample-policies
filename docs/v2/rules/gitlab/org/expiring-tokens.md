# Rule: Prevent Token Expiration in GitLab Organization

**ID**: `gitlab-org-token-about-to-expire`  
**Source**: [v2/rules/gitlab/org/expiring-tokens.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/org/expiring-tokens.yaml)  
**Rego File Path**: `expiring-tokens.rego`  

**Labels**: Gitlab, Organization

**Short Description**: Verify no GitLab organization tokens are about to expire.

## Evidence Requirements

```yaml
signed: false
content_body_type: generic
target_type: data
predicate_type: http://scribesecurity.com/evidence/discovery/v0.1
labels:
- platform=gitlab
- asset_type=organization
- '{{- if eq (index .Context "asset-type") "organization" -}} {{- asset_on_target
  (index .Context "asset-name") -}} {{- else -}} {{- asset_on_target nil -}} {{- end
  -}}'
```
## Rule Parameters (`with`)

```yaml
exiring_in_days: 30
```
