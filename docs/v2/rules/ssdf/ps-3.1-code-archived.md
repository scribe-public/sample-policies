# Rule: Code archived

**ID**: `PS.3.1`  
**Uses**: `ssdf/ps-3.1-code-archived@v2/rules  
**Source**: [v2/rules/ssdf/ps-3.1-code-archived.yaml](https://github.com/scribe-public/sample-policies/v2/rules/ssdf/ps-3.1-code-archived.yaml)  
**Short Description**: PS.3.1 Verify that the software release data is archived.
We assume running in Github thus the code is allways stored in a repository
  
**Mitigation**: Archives code changes to maintain a secure, immutable history for auditing and traceability.
  
**Labels**: SSDF

## Rule Parameters (`with`)

```yaml
allow: true
short_description: Code is archived.
description: Since the code is within a repository, it is archived.
reason: The code is archived in a repository. This is a demo rule, planned to run
  from a workflow in a repository.
```
