#!/usr/bin/env python3

import os
import re
import yaml

# Root output directories for docs
DOCS_ROOT = "docs/v2"
RULES_OUTDIR = os.path.join(DOCS_ROOT, "rules")
INITIATIVES_OUTDIR = os.path.join(DOCS_ROOT, "initiatives")
SAMPLE_POLICIES_REPO = "https://github.com/scribe-public/sample-policies/"


def parse_yaml(file_path):
    """Safely parse a YAML file into a Python dict."""
    with open(file_path, "r") as f:
        try:
            return yaml.safe_load(f) or {}
        except yaml.YAMLError:
            return {}


def ensure_output_dirs():
    """Create the top-level output directories if they don't exist."""
    os.makedirs(RULES_OUTDIR, exist_ok=True)
    os.makedirs(INITIATIVES_OUTDIR, exist_ok=True)

def filepath_to_uses(filepath: str) -> str:
    """
    Translates a file path in the format 'vX/rules/group/.../rule.yaml'
    into a 'uses' reference of the format 'group/.../rule@vX/rules'.

    For example:
      Input:  "v2/rules/sbom/verify-labels.yaml"
      Output: "sbom/verify-labels@v2/rules"
    """
    # Split the file path by '/'
    parts = filepath.split('/')
    if len(parts) < 3 or parts[1] != "rules":
        raise ValueError("File path must be in the format 'vX/rules/group/.../rule.yaml'")
    
    # The first part is the version (e.g., 'v2')
    version = parts[0]
    
    # Skip the second element ("rules") and use the rest for the group and rule
    group_and_rule_parts = parts[2:]
    
    # Remove the file extension from the last element (the rule filename)
    group_and_rule_parts[-1] = os.path.splitext(group_and_rule_parts[-1])[0]
    
    # Join the remaining parts to form the rule path
    rule_path = "/".join(group_and_rule_parts)
    
    # Build and return the uses reference in the required format
    return f"{rule_path}@{version}/rules"

def generate_rule_markdown(rule_data, file_path, file_name, base_source_git):
    """
    Given the YAML data for a rule, produce the Markdown content as a string.
    The doc will be written to a mirrored subdirectory under docs/v2/rules.
    This version uses two trailing spaces to force Markdown line breaks.
    """
    import os
    import yaml

    rule_id = rule_data.get("id", os.path.splitext(file_name)[0])
    name = rule_data.get("name", rule_id)
    rego_path = rule_data.get("path", "")
    description = rule_data.get("description", "")
    full_description = rule_data.get("full-description", "")
    mitigation = rule_data.get("mitigation", "")
    help_url = rule_data.get("help", "")
    labels = rule_data.get("labels", [])
    
    yaml_source_link = os.path.join(base_source_git, file_path)
    file_dir = os.path.dirname(file_path)
    rego_source_link = os.path.join(base_source_git, file_dir, rego_path)
    
    md = []
    md.append(f"# {name}  ")
    md.append("** Type:** Rule  ")
    md.append(f"**ID:** `{rule_id}`  ")
    md.append(f"**Uses:** `{filepath_to_uses(file_path)}`  ")
    md.append(f"**Source:** [{file_path}]({yaml_source_link})  ")
    if rego_path:
        md.append(f"**Rego Source:** [{rego_path}]({rego_source_link})  ")
    if help_url:
        md.append(f"**Help:** {help_url}  ")
    if labels:
        md.append(f"**Labels:** {', '.join(labels)}  ")

    md.append(f"\n{description}")
    md.append("")

    if mitigation:
        md.append("\n## Mitigation  ")
        md.append(mitigation)
        md.append("")


    sign_defaults = rule_data.get("evidence", {}).get("signed", False)
    if sign_defaults:
        md.append(f"> Evidence for this rule **IS* required by default.**\n")
    else:
        md.append(f"> Evidence for this rule **IS NOT** required by default but is recommended.\n")

    if full_description:
        md.append("\n## Description  ")
        md.append(full_description)
        md.append("")
    else:
        md.append("")

    evidence = rule_data.get("evidence", {})
    if evidence:
        md.append("## Evidence Requirements  ")
        md.append("| Field | Value |")
        md.append("|-------|-------|")
        for field, value in evidence.items():
            md.append(f"| {field} | {value} |")
        md.append("")

    with_block = rule_data.get("with", {})
    if with_block:
        md.append("## Rule Parameters (`with`)  ")
        md.append("```yaml")
        md.append(yaml.safe_dump(with_block, sort_keys=False).strip())
        md.append("```\n")
    
    md.append("")
    return "\n".join(md)



def get_current_repo_context():
    from git import Repo
    local_repo = Repo(path=".")
    remote_repo = local_repo.remotes.origin.url
    current_branch = local_repo.active_branch.name
    
    print(f"Current branch: {current_branch}")
    print(f"Remote URL: {remote_repo}")
    norm_github_repo = remote_repo.replace('git@github.com:','https://github.com/').strip('.git')
    # norm_github_repo_with_branch = os.path.join(norm_github_repo, f"tree/{current_branch}")
    print(f"Normalized GitHub repo: {norm_github_repo}")

    return norm_github_repo

def write_rule_doc(file_path, rule_data, base_source_git):
    """
    Write the rule doc to a mirrored subdirectory under docs/v2/rules.
    Returns a dict with keys:
      - "abs_path": absolute path to the .md file,
      - "rel_path": relative path from RULES_OUTDIR,
      - "yaml_data": the parsed rule YAML.
    """
    rel_from_rules = os.path.relpath(file_path, start="v2/rules")
    subdirs, filename = os.path.split(rel_from_rules)
    base_name = os.path.splitext(filename)[0]

    out_dir = os.path.join(RULES_OUTDIR, subdirs)
    os.makedirs(out_dir, exist_ok=True)

    out_md_path = os.path.join(out_dir, base_name + ".md")

    doc_content = generate_rule_markdown(rule_data, file_path, filename, base_source_git)
    with open(out_md_path, "w") as f:
        f.write(doc_content)

    abs_path = os.path.abspath(out_md_path)
    rel_path = os.path.relpath(out_md_path, RULES_OUTDIR)
    return {
        "abs_path": abs_path,
        "rel_path": rel_path,
        "yaml_data": rule_data
    }


def generate_markdown_anchor(text):
    """
    Convert a control name into a valid Markdown anchor.
    - Lowercase everything
    - Replace spaces and special characters with hyphens
    - Remove invalid characters
    """
    text = text.lower().strip()
    text = re.sub(r"[^\w\s-]", "", text)  # Remove special characters
    text = re.sub(r"\s+", "-", text)  # Replace spaces with hyphens
    return f"#{text}"

def generate_initiative_markdown(initiative_data, file_path, file_name, rule_docs_map, base_source_git):
    """
    Build the Markdown content for one initiative.
    The document includes:
      1) A Controls Overview table with Control ID, Name, Description, and Mitigation.
      2) Detailed Controls: for each control, a subheading with its mitigation, plus a table of rules.
    """
    init_id = initiative_data.get("id", os.path.splitext(file_name)[0])
    if init_id == "":
        print(f"# Warning: 'id' field is missing for {file_path}")

    # if file_path has suffix "vX/initiatives/", remove it
    if file_path.startswith("v") and "initiatives" in file_path:
        bundle_version = file_path.split("/")[0]

    version = initiative_data.get("version", "")
    if version == "":
        print(f"# Warning: 'version' field is missing for {file_path}")

    name = initiative_data.get("name", init_id)
    if name == "":
        print(f"# Warning: 'name' field is missing for {file_path}")

    description = initiative_data.get("description", "")
    full_description = initiative_data.get("full-description", "")
    mitigation = initiative_data.get("mitigation", "")
    help_url = initiative_data.get("help", "")
    source_link = os.path.join(base_source_git, file_path)
    md = []
    # Initiative header
    md.append(f"# {name}  ")
    md.append("** Type:** Initiative  ")
    md.append(f"**ID:** `{init_id}`  ")
    md.append(f"**Version:** `{version}`  ")
    md.append(f"**Bundle-Version:** `{bundle_version}`  ")
    md.append(f"**Source:** [{file_path}]({source_link})  ")
    md.append(f"\n{description}")
    md.append("")

    if mitigation:
        md.append("\n## Mitigation  ")
        md.append(mitigation)
        md.append("")

    if help_url:
        md.append(f"**Help:** {help_url}  ")

    sign_defaults = initiative_data.get("defaults", {}).get("evidence", {}).get("signed", False)
    if sign_defaults:
        md.append(f"> Evidence for this initiative **IS** required by default.**\n")
    else:
        md.append(f"> Evidence for this initiative **IS NOT** required by default but is recommended.\n")
    
    if full_description:
        md.append(f"## **Description**\n")
        md.append(full_description)

    controls = initiative_data.get("controls", [])
    if not controls:
        md.append("_No controls defined._")
        return "\n".join(md)
    

    # Controls Overview with Mitigation column
    md.append("## Controls Overview\n")
    md.append("| Control ID | Control Name | Control Description | Mitigation |")
    md.append("|------------|--------------|---------------------|------------|")
    for ctrl in controls:
        ctrl_id = ctrl.get("id", "")
        ctrl_name = ctrl.get("name", ctrl_id)
        # ctrl_section_link = f"## [{ctrl_id}] {ctrl_name}".replace(" ", "-").lower()
        ctrl_section_link = generate_markdown_anchor(f"{ctrl_id} {ctrl_name}")

        ctrl_desc = ctrl.get("description", "")
        ctrl_mitigation = ctrl.get("mitigation", "")
        md.append(f"|  [{ctrl_id}]({ctrl_section_link}) | {ctrl_name} | {ctrl_desc} | {ctrl_mitigation} |")
    md.append("")

    defaults = initiative_data.get("defaults", {})
    if defaults:
        if "evidence" in defaults:
            # Build default table for each field in "evidence"
            md.append("## Evidence Defaults\n")
            md.append("| Field | Value |")
            md.append("|-------|-------|")
            for field, value in defaults["evidence"].items():
                md.append(f"| {field} | {value} |")
            md.append("")

    # Detailed Controls
    md.append("---\n")
    md.append("# Detailed Controls\n")
    for ctrl in controls:
        ctrl_id = ctrl.get("id", "")
        ctrl_name = ctrl.get("name", ctrl_id)
        ctrl_desc = ctrl.get("description", "")
        ctrl_full_desc = ctrl.get("full-description", "")
        help_url = ctrl.get("help", "")
        ctrl_mitigation = ctrl.get("mitigation", "")
        ctrl_rules = ctrl.get("rules", [])

        md.append(f"## [{ctrl_id}] {ctrl_name}")
        if help_url:
            md.append(f"[Help]({help_url})  ")

        md.append(f"\n{ctrl_desc}")
        md.append("")

        if ctrl_mitigation:
            md.append("\n### Mitigation  ")
            md.append(ctrl_mitigation)
            md.append("")

        if ctrl_full_desc:
            md.append(f"### **Description**\n")
            md.append(ctrl_full_desc)
            md.append("")

        if not ctrl_rules:
            md.append("_No rules defined for this control._\n")
            continue

        # Build a table for rules (Rule Name becomes clickable)
        md.append("### Rules\n")
        md.append("| Rule ID | Rule Name | Rule Description |")
        md.append("|---------|-----------|------------------|")
        for rule_ref in ctrl_rules:
            snippet_r_id = rule_ref.get("id", "")
            snippet_r_name = rule_ref.get("name", snippet_r_id)
            snippet_r_desc = rule_ref.get("description", "")
            r_uses = rule_ref.get("uses", "")

            final_r_id = snippet_r_id
            final_r_name = snippet_r_name
            final_r_desc = snippet_r_desc
            link_md = final_r_name  # default plain text

            if r_uses:
                before_at = r_uses.split("@")[0]  # e.g. "gitlab/org/max-admins"
                subdirs, base_name = os.path.split(before_at)
                key_for_map = os.path.join(subdirs, base_name) if subdirs else base_name

                if key_for_map in rule_docs_map:
                    rule_info = rule_docs_map[key_for_map]
                    abs_rule_path = rule_info["abs_path"]
                    rule_yaml = rule_info["yaml_data"]
                    if not final_r_id:
                        final_r_id = rule_yaml.get("id", "")
                    if not final_r_name:
                        final_r_name = rule_yaml.get("name", "")
                    if not final_r_desc:
                        final_r_desc = rule_yaml.get("description", "")
                    rel_path_from_initiatives = os.path.relpath(abs_rule_path, os.path.abspath(INITIATIVES_OUTDIR))
                    link_md = f"[{final_r_name}]({rel_path_from_initiatives})"
                else:
                    link_md = r_uses
            else:
                link_md = final_r_name

            row = f"| {final_r_id} | {link_md} | {final_r_desc} |"
            md.append(row)
        md.append("")
    return "\n".join(md)


def write_initiative_doc(file_path, initiative_data, rule_docs_map, base_source_git):
    """
    Write the initiative doc to docs/v2/initiatives/<original_filename>.md.
    For example, if the initiative file is "slsa.l2.yaml", the doc will be "slsa.l2.md".
    """
    base_file = os.path.basename(file_path)
    base_no_ext = os.path.splitext(base_file)[0]

    out_md_path = os.path.join(INITIATIVES_OUTDIR, base_no_ext + ".md")
    os.makedirs(INITIATIVES_OUTDIR, exist_ok=True)

    doc_content = generate_initiative_markdown(initiative_data, file_path, base_file, rule_docs_map, base_source_git)
    with open(out_md_path, "w") as f:
        f.write(doc_content)

    return os.path.abspath(out_md_path)


def main():
    ensure_output_dirs()

    rule_files = []        # list of (file_path, rule_yaml_data)
    initiative_files = []  # list of (file_path, initiative_yaml_data)

    base_source_git = get_current_repo_context()

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
                pass


    # Build a map of rule docs.
    # Key: relative path from "v2/rules" without .yaml extension (e.g. "gitlab/org/max-admins")
    # Value: dict with "abs_path", "rel_path", "yaml_data"
    rule_docs_map = {}
    for file_path, r_data in rule_files:
        if "v2/rules" in file_path:
            rel_from_rules = os.path.relpath(file_path, start="v2/rules")
            subdirs, filename = os.path.split(rel_from_rules)
            base_name = os.path.splitext(filename)[0]
            key_for_map = os.path.join(subdirs, base_name) if subdirs != "." else base_name
        else:
            key_for_map = os.path.splitext(os.path.basename(file_path))[0]
        doc_info = write_rule_doc(file_path, r_data, base_source_git)
        rule_docs_map[key_for_map] = doc_info

    for file_path, i_data in initiative_files:
        write_initiative_doc(file_path, i_data, rule_docs_map, base_source_git)

    print("[OK] Documentation has been generated under docs/v2/")


if __name__ == "__main__":
    main()
