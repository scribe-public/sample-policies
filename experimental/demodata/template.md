# Create you own results policy rule

## Description

This ruls enables you to create the results directly from the policy rule `yml` file.

Rule configuration:

<!--
{
    "command": "cat data.yml"
}
-->

Just fill in - true or false, reasons, violation detail etc.

## How to use

Create a some target attestation:

<!--
{
    "command": "valint bom busybox:latest 2>&1",
    "print_command": true
}
-->

Evaluate the policy:
<!--
{
    "command": "valint verify busybox:latest --rule data.yml 2>&1",
    "print_command": true
}
-->
