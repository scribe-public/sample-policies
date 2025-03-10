# Protect CI Secrets in GitLab Project  
**Type:** Rule  
**ID:** `gitlab-project-protect-ci-secrets`  
**Uses:** `gitlab/project/protect-ci-secrets@v2/rules`  
**Source:** [v2/rules/gitlab/project/protect-ci-secrets.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/protect-ci-secrets.yaml)  
**Rego Source:** [protect-ci-secrets.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/protect-ci-secrets.rego)  
**Labels:** Gitlab, Project  

Verify secrets in the GitLab project are not shared.

> Evidence for this rule **IS NOT** required by default but is recommended.


## Evidence Requirements  
| Field | Value |
|-------|-------|
| signed | False |
| content_body_type | generic |
| target_type | data |
| predicate_type | http://scribesecurity.com/evidence/discovery/v0.1 |
| labels | - platform=gitlab<br>- asset_type=project |

## Rule Parameters (`with`)  
```yaml
pattern: (?i)(token|secret)
```

