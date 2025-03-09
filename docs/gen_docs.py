#!/usr/bin/env python3

import os
import yaml

# Root output directory for docs
DOCS_ROOT = "docs/v2"
RULES_OUTDIR = os.path.join(DOCS_ROOT, "rules")
INITIATIVES_OUTDIR = os.path.join(DOCS_ROOT, "initiatives")


def parse_yaml(file_path):
    """
    Safely parse a YAML file into a Python dict.
    Returns {} if empty or on error.
    """
    with open(file_path, "r") as f:
        try:
            return yaml.safe_load(f) or {}
        except yaml.YAMLError:
            return {}


def ensure_output_dirs():
    """
    Create the top-level output directories if they don't exist.
    """
    os.makedirs(RULES_OUTDIR, exist_ok=True)
    os.makedirs(INITIATIVES_OUTDIR, exist_ok=True)


def generate_rule_markdown(rule_data, file_name):
    """
    Given the YAML data for a rule, produce the Markdown content as a string.
    We'll write it out to the mirrored subdirectory under docs/v2/rules.
    """
    # Basic fields from the rule YAML
    rule_id = rule_data.get("id", os.path.splitext(file_name)[0])
    name = rule_data.get("name", rule_id)
    path = rule_data.get("path", "")  # path to .rego (if any)
    description = rule_data.get("description", "")
    full_description = rule_data.get("full-description", "")
    mitigation = rule_data.get("mitigation", "")
    help_url = rule_data.get("help", "")
    labels = rule_data.get("labels", [])

    # Start building Markdown lines
    md = []
    md.append(f"# Rule: {name}\n")
    md.append(f"**ID**: `{rule_id}`  ")
    md.append(f"**Source YAML**: `{file_name}`  ")
    if path:
        md.append(f"**Rego File Path**: `{path}`  ")
    md.append("")  # blank line

    if labels:
        md.append(f"**Labels**: {', '.join(labels)}\n")

    md.append(f"**Short Description**: {description}\n")

    if full_description:
        md.append(f"**Full Description**:\n\n{full_description}\n")
    if mitigation:
        md.append(f"**Mitigation**:\n\n{mitigation}\n")
    if help_url:
        md.append(f"**Help**: {help_url}\n")

    # If the rule requires certain evidence
    evidence = rule_data.get("evidence", {})
    if evidence:
        md.append("## Evidence Requirements\n")
        md.append("```yaml")
        md.append(yaml.safe_dump(evidence, sort_keys=False).strip())
        md.append("```")

    # If the rule has parameters in "with"
    with_block = rule_data.get("with", {})
    if with_block:
        md.append("## Rule Parameters (`with`)\n")
        md.append("```yaml")
        md.append(yaml.safe_dump(with_block, sort_keys=False).strip())
        md.append("```")

    md.append("")  # final newline
    return "\n".join(md)


def write_rule_doc(file_path, rule_data):
    """
    Write the rule doc to a mirrored subdirectory under docs/v2/rules.
    Return a dictionary with keys:
      {
        "abs_path": <absolute path to the .md>,
        "rel_path": <rel path from docs/v2/rules>,
        "yaml_data": <the entire parsed rule YAML>
      }

    Example:
      file_path = "v2/rules/github/repository/branch-protection.yaml"
      -> doc at "docs/v2/rules/github/repository/branch-protection.md"
    """
    # Derive a path relative to "v2/rules" so we know the subdirs
    rel_from_rules = os.path.relpath(file_path, start="v2/rules")
    # e.g. "github/repository/branch-protection.yaml"
    subdirs, filename = os.path.split(rel_from_rules)         # ("github/repository", "branch-protection.yaml")
    base_name = os.path.splitext(filename)[0]                 # "branch-protection"

    # Make the mirrored subdirectory under docs/v2/rules
    out_dir = os.path.join(RULES_OUTDIR, subdirs)             # "docs/v2/rules/github/repository"
    os.makedirs(out_dir, exist_ok=True)

    # Final .md path
    out_md_path = os.path.join(out_dir, base_name + ".md")

    # Generate the doc content
    doc_content = generate_rule_markdown(rule_data, filename)
    with open(out_md_path, "w") as f:
        f.write(doc_content)

    # Return the absolute path and the relative path
    abs_path = os.path.abspath(out_md_path)
    rel_path = os.path.relpath(out_md_path, RULES_OUTDIR)  # e.g. "github/repository/branch-protection.md"

    return {
        "abs_path": abs_path,
        "rel_path": rel_path,
        "yaml_data": rule_data  # so we can fallback to the real ID/name/description if the initiative is missing it
    }


def generate_initiative_markdown(initiative_data, file_name, rule_docs_map):
    """
    Build the Markdown content for one initiative with:
      1) Controls Overview table
      2) Detailed per-control table of rules

    `rule_docs_map` is a dict:
       key   = subdirs/base_name (e.g. "github/repository/branch-protection")
       value = {
         "abs_path": <absolute .md path>,
         "rel_path": <relative path from docs/v2/rules>,
         "yaml_data": <rule YAML>
       }
    """
    init_id = initiative_data.get("id", os.path.splitext(file_name)[0])
    version = initiative_data.get("version", "")
    name = initiative_data.get("name", init_id)
    description = initiative_data.get("description", "")
    full_description = initiative_data.get("full-description", "")
    mitigation = initiative_data.get("mitigation", "")
    help_url = initiative_data.get("help", "")

    md = []
    # --- Initiative Header ---
    md.append(f"# Initiative: {name}\n")
    md.append(f"**ID**: `{init_id}`  ")
    md.append(f"**Version**: `{version}`  ")
    md.append(f"**Source YAML**: `{file_name}`  ")
    md.append("")

    md.append(f"**Short Description**: {description}\n")
    if full_description:
        md.append(f"**Full Description**:\n\n{full_description}\n")
    if mitigation:
        md.append(f"**Mitigation**:\n\n{mitigation}\n")
    if help_url:
        md.append(f"**Help**: {help_url}\n")

    # Defaults block
    defaults = initiative_data.get("defaults", {})
    if defaults:
        md.append("## Defaults\n")
        md.append("```yaml")
        md.append(yaml.safe_dump(defaults, sort_keys=False).strip())
        md.append("```")
        md.append("")

    controls = initiative_data.get("controls", [])
    if not controls:
        md.append("_No controls defined._")
        return "\n".join(md)

    # 1) Controls Overview
    md.append("## Controls Overview\n")
    md.append("| Control ID | Control Name | Control Description |")
    md.append("|------------|--------------|---------------------|")
    for ctrl in controls:
        ctrl_id = ctrl.get("id", "")
        ctrl_name = ctrl.get("name", ctrl_id)
        ctrl_desc = ctrl.get("description", "")
        md.append(f"| {ctrl_id} | {ctrl_name} | {ctrl_desc} |")
    md.append("")

    # 2) Detailed Controls
    md.append("## Detailed Controls\n")
    for ctrl in controls:
        ctrl_id = ctrl.get("id", "")
        ctrl_name = ctrl.get("name", ctrl_id)
        ctrl_desc = ctrl.get("description", "")
        ctrl_rules = ctrl.get("rules", [])

        md.append(f"### Control: {ctrl_name} (ID: `{ctrl_id}`)")
        if ctrl_desc:
            md.append(f"**Description**: {ctrl_desc}\n")

        if not ctrl_rules:
            md.append("_No rules defined for this control._\n")
            continue

        # Build a table of rules
        md.append("#### Rules\n")
        md.append("| Rule ID | Rule Name | Rule Description |")
        md.append("|---------|----------|------------------|")

        for rule_ref in ctrl_rules:
            # Fields from initiative snippet
            snippet_r_id = rule_ref.get("id", "")
            snippet_r_name = rule_ref.get("name", snippet_r_id)
            snippet_r_desc = rule_ref.get("description", "")
            r_uses = rule_ref.get("uses", "")  

            # We'll store final ID, Name, Desc into local variables
            final_r_id = snippet_r_id
            final_r_name = snippet_r_name
            final_r_desc = snippet_r_desc

            # By default, no hyperlink; just plain text
            link_md = final_r_name

            if r_uses:
                # e.g. "github/repository/branch-protection@v2/rules"
                before_at = r_uses.split("@")[0]  # "github/repository/branch-protection"
                subdirs, base_name = os.path.split(before_at)
                key_for_map = os.path.join(subdirs, base_name) if subdirs else base_name

                if key_for_map in rule_docs_map:
                    rule_info = rule_docs_map[key_for_map]
                    abs_rule_path = rule_info["abs_path"]
                    rule_yaml = rule_info["yaml_data"]

                    # Fallback if snippet is missing data
                    if not final_r_id:
                        final_r_id = rule_yaml.get("id", "")
                    if not final_r_name:
                        final_r_name = rule_yaml.get("name", "")
                    if not final_r_desc:
                        final_r_desc = rule_yaml.get("description", "")

                    # Create clickable link for the name
                    rel_path_from_initiatives = os.path.relpath(abs_rule_path, os.path.abspath(INITIATIVES_OUTDIR))
                    link_md = f"[{final_r_name}]({rel_path_from_initiatives})"
                else:
                    # Key not found => fallback to the snippet or just display the uses
                    pass
            else:
                # If there's no 'uses', we won't know where to link
                pass

            # The row uses the final overridden fields
            row = (
                f"| {final_r_id} "
                f"| {link_md} "
                f"| {final_r_desc} |"
            )
            md.append(row)

        md.append("")  # blank line after each control

    return "\n".join(md)


def write_initiative_doc(file_path, initiative_data, rule_docs_map):
    """
    Write the initiative doc to docs/v2/initiatives/<initiative_id>.md
    Returns the absolute path to the doc
    """
    base_file = os.path.basename(file_path)  # e.g. "slsa.l2.yaml"
    init_id = initiative_data.get("id", os.path.splitext(base_file)[0])

    out_md_path = os.path.join(INITIATIVES_OUTDIR, init_id + ".md")
    os.makedirs(INITIATIVES_OUTDIR, exist_ok=True)

    doc_content = generate_initiative_markdown(initiative_data, base_file, rule_docs_map)
    with open(out_md_path, "w") as f:
        f.write(doc_content)

    return os.path.abspath(out_md_path)


def main():
    ensure_output_dirs()
    
    # We'll categorize discovered YAML files
    rule_files = []        # list of (file_path, rule_yaml_data)
    initiative_files = []  # list of (file_path, initiative_yaml_data)

    # 1) Walk v2/ to find .yaml
    for dirpath, _, filenames in os.walk("v2"):
        for filename in filenames:
            if not filename.endswith(".yaml"):
                continue
            full_path = os.path.join(dirpath, filename)
            data = parse_yaml(full_path)
            ctype = data.get("config-type", "").lower()

            if ctype == "rule":
                rule_files.append((full_path, data))
            elif ctype == "initiative":
                initiative_files.append((full_path, data))
            else:
                # skip unknown or missing config-type
                pass

    # 2) Generate docs for each rule, storing them in rule_docs_map
    # Key: subdirs/base_name, e.g. "github/repository/branch-protection"
    # Value: dict with "abs_path", "rel_path", "yaml_data"
    rule_docs_map = {}
    for file_path, r_data in rule_files:
        # figure out the subdir/base_name key
        rel_from_rules = os.path.relpath(file_path, start="v2/rules")
        subdirs, filename = os.path.split(rel_from_rules)
        base_name = os.path.splitext(filename)[0]
        key_for_map = os.path.join(subdirs, base_name) if subdirs != "." else base_name

        doc_info = write_rule_doc(file_path, r_data)
        rule_docs_map[key_for_map] = doc_info

    # 3) Generate docs for each initiative
    for file_path, i_data in initiative_files:
        write_initiative_doc(file_path, i_data, rule_docs_map)

    print("[OK] Documentation has been generated under docs/v2/")


if __name__ == "__main__":
    main()
