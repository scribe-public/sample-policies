# Verify Unified Security Reports

## Purpose

ScribeHub is capable of unifying security reports by different scanners to a generic format that can later be verified by `valint` without even knowing the original scanner. This document explains how to produce and verify the unified security reports.

## Generating Unified Security Reports

TO geenrate a unified security report, ScribeHub needs the original report being uploaded to the platform. To do so, we need to use `valint`.

Say, we have a GitLab SAST report as `gitlab-sast-report.json`. We can generate an attestation out of it by running:

```bash
valint evidence examples/gl-sast-report.json -E --product-key my_product --product-version latest --parser gitlabsast
```

After the evidence being processed by ScribeHub, we can download and verify the unified security report from the platform.

The same goes for other scanners like `trivy`, `burp`, etc:

```bash
valint evidence examples/gl-secret-detection-report.json -E --product-key my_product --product-version latest --parse
```

```bash
valint evidence examples/trivy_vulns.json -E --product-key my_product --product-version latest --parser trivy
```

```bash
valint evidence examples/trivy_secrets.json -E --product-key my_product --product-version latest --parser trivy
```

## Verifying Unified Security Reports

Rule configuration is pretty simple:

<!--
{
    "command": "cat 3rd-pty.yaml",
    "output-format": "yaml"
}
-->
<!-- { "object-type": "command-output-start" } -->
```yaml
name: 3rd-pty-policy
path: 3rd-pty.rego

description: "Verify no violations in 3rd party scanner reports by a custom rule"
labels:
  - SCA
initiatives:
  - Default

evidence:
  signed: true
  content_body_type: generic
  target_type: data
  predicate_type: http://scribesecurity.com/evidence/finding/v0.1

with:
  severities: []
  titles: []
  cwes: []
  descriptions: []
  component_names: []
```
<!-- { "object-type": "command-output-end" } -->


Each parameter is a filter and can be set by a list of ORed values. All the filters are combined by the AND rule.
In order to customize the rule, simply reuse it as any other bundle rule and modify the parameters.

After configuring the rule, we can verify the unified security report by running:

<!--
{
    "command": "valint verify -E --product-key my_product --product-version latest --rule unified.yaml --attest.default=x509-env",
    "output-format": "bash",
    "print_command": true,
    "limit": 34
}
-->
<!-- { "object-type": "command-output-start" } -->
```bash
valint verify -E --product-key my_product --product-version latest --rule unified.yaml --attest.default=x509-env
```
```bash
[0;90m[2024-05-29 11:45:45][0m [0;32m INFO[0m[0;36m enabled:[0m [cache-storer] using evidence storer
[0;90m[2024-05-29 11:45:45][0m [0;32m INFO[0m[0;36m target:[0m analyzing [0;32mtarget[0m=empty
[0;90m[2024-05-29 11:45:45][0m [0;33m WARN[0m[0;36m git:[0m stat failed%!(EXTRA <nil>)
[0;90m[2024-05-29 11:45:45][0m [0;32m INFO[0m[0;36m git:[0m cloning remote repository: https://github.com/scribe-public/sample-policies @ refs/heads/dev, Depth: 1
[0;90m[2024-05-29 11:45:46][0m [0;32m INFO[0m[0;36m git:[0m cloning success: https://github.com/scribe-public/sample-policies @ refs/heads/dev, Depth: 1
[0;90m[2024-05-29 11:45:46][0m [0;32m INFO[0m[0;36m git:[0m HEAD 1d46a0df3fb181a81ceb4fbca878fc7cf676cbfb,
[0;90m[2024-05-29 11:45:46][0m [0;32m INFO[0m[0;36m cocosign:[0m config selection, default: x509-env, Scheme: empty
[0;90m[2024-05-29 11:45:46][0m [0;32m INFO[0m environment-context [0;32mcontext_type[0m=local [0;32mgit_branch[0m=unified_report_rule [0;32mgit_commit[0m=e81f63392b1cc01217942bee83184efca1b096ea [0;32mgit_ref[0m=refs/heads/unified_report_rule [0;32mgit_url[0m=https://github.com/scribe-public/sample-policies.git [0;32mhostname[0m=thinkpad [0;32minput_scheme[0m=empty [0;32mpredicate_type[0m=http://scribesecurity.com/evidence/generic/v0.1 [0;32msigned[0m=false [0;32mtimestamp[0m=2024-05-29T11:45:45+03:00 [0;32muser[0m=user
[0;90m[2024-05-29 11:45:46][0m [0;32m INFO[0m[0;36m enabled:[0m [x509-verifier] using verifier
[0;90m[2024-05-29 11:45:46][0m [0;33m WARN[0m[0;36m default:[0m [verify-artifact] [unified-policy] no identity applied (accepts ALL)
[0;90m[2024-05-29 11:45:46][0m [0;32m INFO[0m[0;36m storer:[0m [cache] download success, Ref: /home/user/.cache/valint/sha256-2f7abf1b0d720e611dc2d1a1696f354917d7fb685f4eb9f9db30218bda60cb45.generic.sig.json
[0;90m[2024-05-29 11:45:46][0m [0;32m INFO[0m[0;36m verify:[0m [TRUSTED] verify success, CA: x509-verifier, CN: Scribe-CA, Emails: [], URIs: []
[0;90m[2024-05-29 11:45:46][0m [0;33m WARN[0m[0;36m default:[0m [verify-artifact] [unified-policy] no identity applied (accepts ALL)
[0;90m[2024-05-29 11:45:46][0m [0;33m WARN[0m[0;36m default:[0m [verify-artifact] [unified-policy] [] allow: false - 1 violations | 0 max allowed
[0;90m[2024-05-29 11:45:46][0m [0;33m WARN[0m[0;36m default:[0m [verify-artifact] [unified-policy] [Invalid Unified Report] check-violation {
 "component_name": "component_name not specifield",
 "cwe": "cwe not specifield",
 "description": "GitLab Personal Access Token secret has been found in commit 993a0d85.\nglpat-ydPdyj7vUXq7xH-riRvR",
 "severity": "Critical",
 "title": "GitLab Personal Access Token detected; please remove and revoke it if this is a leak."
}
[0;90m[2024-05-29 11:45:46][0m [0;33m WARN[0m[0;36m default:[0m [verify-artifact] [unified-policy] rule failed
[0;90m[2024-05-29 11:45:46][0m [0;33m WARN[0m[0;36m policy:[0m [default] failed
[0;90m[2024-05-29 11:45:46][0m [0;32m INFO[0m Policy "default" Evaluation Summary:
┌──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
│ Policy "default" Evaluation Summary                                                                                                  │
├─────────────────────────┬───────┬────────┬────────────────────────┬───────────────────┬──────────────────────────────────────────────┤
│ RULE NAME               │ LEVEL │ SIGNED │ SIGNATURE VERIFICATION │ POLICY EVALUATION │ COMMENT                                      │
├─────────────────────────┼───────┼────────┼────────────────────────┼───────────────────┼──────────────────────────────────────────────┤
│ unified-policy          │ error │ true   │ passed                 │ failed            │ 1/1 evidence origin and signature verified,  │
│                         │       │        │                        │                   │ 1 violations | 0 max allowed                 │
├─────────────────────────┼───────┼────────┼────────────────────────┼───────────────────┼──────────────────────────────────────────────┤
│ AGGREGATE POLICY RESULT │       │        │                        │ FAILED            │                                              │
└─────────────────────────┴───────┴────────┴────────────────────────┴───────────────────┴──────────────────────────────────────────────┘
```
<!-- { "object-type": "command-output-end" } -->
