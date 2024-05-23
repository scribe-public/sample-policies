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
    "command": "touch target.txt",
    "print_command": true
}
-->

<!--
{
    "command": "valint bom target.txt 2>&1",
    "print_command": true
}
-->

Evaluate the policy:
<!--
{
    "command": "valint verify target.txt --rule data.yml --output-file results-sarif.json 2>&1",
    "print_command": true
}
-->
