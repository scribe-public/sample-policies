# Rule: Limit admins

**ID**: `PS.1.3`
**Source**: [v2/rules/ssdf/ps-1-limit-admins.yaml](https://github.com/scribe-public/sample-policies/v2/rules/ssdf/ps-1-limit-admins.yaml)
**Uses**: `ssdf/ps-1-limit-admins@v2/rules

**Labels**: SSDF

**Short Description**: PS.1 Restrict the maximum number of organization admins

**Mitigation**:

Limits the number of administrative accounts, minimizing the potential for abuse of elevated privileges.


## Rule Parameters (`with`)

```yaml
max_admins: 3
```
