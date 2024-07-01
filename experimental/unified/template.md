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