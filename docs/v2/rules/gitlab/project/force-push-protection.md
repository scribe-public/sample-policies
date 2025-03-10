# Disallow Force Push in GitLab Project  
**Type:** Rule  
**ID:** `gitlab-project-disallow-force-push`  
**Uses:** `gitlab/project/force-push-protection@v2/rules`  
**Source:** [v2/rules/gitlab/project/force-push-protection.yaml](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/force-push-protection.yaml)  
**Rego Source:** [force-push-protection.rego](https://github.com/scribe-public/sample-policies/v2/rules/gitlab/project/force-push-protection.rego)  
**Labels:** Gitlab, Project  

Verify force pushes in the GitLab project are disallowed to maintain repository integrity.

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
branch: main
```

