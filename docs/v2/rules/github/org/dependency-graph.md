# Rule: Verify dependency_graph_enabled_for_new_repositories setting

**ID**: `github-org-dependency-graph`
**Source**: [v2/rules/github/org/dependency-graph.yaml](https://github.com/scribe-public/sample-policies/v2/rules/github/org/dependency-graph.yaml)
**Uses**: `github/org/dependency-graph@v2/rules
**Rego File Path**: `dependency-graph.rego`

**Labels**: GitHub, Organization

**Short Description**: Verify `dependency_graph` is enabled for new repositories in the GitHub organization.

## Evidence Requirements

```yaml
signed: false
content_body_type: generic
target_type: data
predicate_type: http://scribesecurity.com/evidence/discovery/v0.1
labels:
- platform=github
- asset_type=organization
- '{{- if eq (index .Context "asset-type") "organization" -}} {{- asset_on_target
  (index .Context "asset-name") -}} {{- else -}} {{- asset_on_target nil -}} {{- end
  -}}'
```
## Rule Parameters (`with`)

```yaml
desired_value: false
```
