# Verify dependency_graph_enabled_for_new_repositories setting  
**Type:** Rule  
**ID:** `github-org-dependency-graph`  
**Uses:** `github/org/dependency-graph@v2/rules`  
**Source:** [v2/rules/github/org/dependency-graph.yaml](https://github.com/scribe-public/sample-policies/v2/rules/github/org/dependency-graph.yaml)  
**Rego Source:** [dependency-graph.rego](https://github.com/scribe-public/sample-policies/v2/rules/github/org/dependency-graph.rego)  
**Labels:** GitHub, Organization  

Verify `dependency_graph` is enabled for new repositories in the GitHub organization.

> Evidence for this rule **IS NOT** required by default but is recommended.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | ['platform=github', 'asset_type=organization', '{{- if eq (index .Context "asset-type") "organization" -}} {{- asset_on_target (index .Context "asset-name") -}} {{- else -}} {{- asset_on_target nil -}} {{- end -}}'] |

## Rule Parameters (`with`)  
```yaml
desired_value: false
```

