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
    "command": "cat unified.yaml",
    "output-format": "yaml"
}
-->
<!-- { "object-type": "command-output-start" } -->
```yaml
name: unified-policy
path: unified.rego

description: "Verify a unified report against a set of rules"
labels:
  - unified
initiatives:
  - bundle-rule

evidence:
  signed: false
  format-type: generic
  target_type: data
  predicate_type: http://scribesecurity.com/evidence/finding/v0.1
  parser: Trivy

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
    "command": "valint verify -E --product-key my_product --product-version latest --rule unified.yaml",
    "output-format": "bash",
    "print_command": true,
    "limit": 34
}
-->
<!-- { "object-type": "command-output-start" } -->
```bash
valint verify -E --product-key my_product --product-version latest --rule unified.yaml
```
```bash
[0;90m[2024-05-28 14:32:26][0m [0;32m INFO[0m[0;36m enabled:[0m [cache-storer] using evidence storer
[0;90m[2024-05-28 14:32:27][0m [0;32m INFO[0m[0;36m enabled:[0m [scribe-storer] using evidence storer
[0;90m[2024-05-28 14:32:27][0m [0;32m INFO[0m[0;36m target:[0m analyzing [0;32mtarget[0m=empty
[0;90m[2024-05-28 14:32:27][0m [0;32m INFO[0m[0;36m git:[0m stat default-branch: 79c5471dbfb952b589d7f870350dd148f3faafa5 refs/heads/main
[0;90m[2024-05-28 14:32:27][0m [0;32m INFO[0m[0;36m git:[0m cloning remote repository: https://github.com/scribe-public/sample-policies @ refs/heads/dev, Depth: 1
[0;90m[2024-05-28 14:32:28][0m [0;32m INFO[0m[0;36m git:[0m cloning success: https://github.com/scribe-public/sample-policies @ refs/heads/dev, Depth: 1
[0;90m[2024-05-28 14:32:28][0m [0;32m INFO[0m[0;36m git:[0m HEAD 1d46a0df3fb181a81ceb4fbca878fc7cf676cbfb,
[0;90m[2024-05-28 14:32:28][0m [0;32m INFO[0m[0;36m cocosign:[0m config selection, default: sigstore, Scheme: empty
[0;90m[2024-05-28 14:32:28][0m [0;32m INFO[0m environment-context [0;32mcontext_type[0m=local [0;32mgit_branch[0m=unified_report_rule [0;32mgit_commit[0m=f39edffe0acc9ea052d867a99532e56574a09186 [0;32mgit_ref[0m=refs/heads/unified_report_rule [0;32mgit_url[0m=https://github.com/scribe-public/sample-policies.git [0;32mhostname[0m=thinkpad [0;32minput_scheme[0m=empty [0;32mname[0m=my_product [0;32mpredicate_type[0m=http://scribesecurity.com/evidence/generic/v0.1 [0;32mproduct_version[0m=latest [0;32msigned[0m=false [0;32mtimestamp[0m=2024-05-28T14:32:27+03:00 [0;32muser[0m=viktor
[0;90m[2024-05-28 14:32:28][0m [0;32m INFO[0m[0;36m enabled:[0m [rekor-storer] using storer
[0;90m[2024-05-28 14:32:28][0m [0;32m INFO[0m[0;36m enabled:[0m [fulcio-verifier] using verifier
[0;90m[2024-05-28 14:32:29][0m [0;31mERROR[0m rule list [unified-policy] failed resource not found, no evidence found
[0;90m[2024-05-28 14:32:29][0m [0;33m WARN[0m[0;36m policy:[0m [default] failed, Err: resource not found, no evidence found
[0;90m[2024-05-28 14:32:29][0m [0;32m INFO[0m Policy "default" Evaluation Summary: 
┌───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
│ Policy "default" Evaluation Summary                                                                                           │
├─────────────────────────┬───────┬────────┬────────────────────────┬───────────────────┬───────────────────────────────────────┤
│ RULE NAME               │ LEVEL │ SIGNED │ SIGNATURE VERIFICATION │ POLICY EVALUATION │ COMMENT                               │
├─────────────────────────┼───────┼────────┼────────────────────────┼───────────────────┼───────────────────────────────────────┤
│ unified-policy          │ error │ false  │ N/A                    │ failed            │ resource not found, no evidence found │
├─────────────────────────┼───────┼────────┼────────────────────────┼───────────────────┼───────────────────────────────────────┤
│ AGGREGATE POLICY RESULT │       │        │                        │ FAILED            │                                       │
└─────────────────────────┴───────┴────────┴────────────────────────┴───────────────────┴───────────────────────────────────────┘

[0;90m[2024-05-28 14:32:29][0m [0;32m INFO[0m[0;36m output:[0m File write to FS, Path: /home/viktor/.cache/valint/sha256-607609ed22d7c71b1d6c59641d40544c03706cd0ee26b6015232921df0d5d842.sarif.json
[0;90m[2024-05-28 14:32:29][0m [0;32m INFO[0m[0;36m storer:[0m [cache] upload success [0;32mref[0m=/home/viktor/.cache/valint/sha256-607609ed22d7c71b1d6c59641d40544c03706cd0ee26b6015232921df0d5d842.sarif.json [0;32mtype[0m=cache
[0;90m[2024-05-28 14:32:29][0m [0;32m INFO[0m[0;36m evidence:[0m known evidence type
[0;90m[2024-05-28 14:32:31][0m [0;32m INFO[0m[0;36m scribe:[0m upload evidence successfully, FileID: 38680
[0;90m[2024-05-28 14:32:31][0m [0;32m INFO[0m[0;36m storer:[0m [scribe] upload success [0;32mref[0m=38680 [0;32mtype[0m=scribe
[0;90m[2024-05-28 14:32:31][0m [0;32m INFO[0m[0;36m event:[0m <12>1 2024-05-28T14:32:31.68565+03:00 thinkpad valint 42906 1008 - Policies [default] failed with the following errors.
* rule [unified-policy] failed resource not found, no evidence found
Error: policy check failed, Policies [default] failed with the following errors.
* rule [unified-policy] failed resource not found, no evidence found

```
<!-- { "object-type": "command-output-end" } -->
