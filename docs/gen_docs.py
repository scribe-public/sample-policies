#!/usr/bin/env python3

import os
import re
import yaml
import json


# Root output directories for docs
DOCS_ROOT = "docs/v2"
RULES_OUTDIR = os.path.join(DOCS_ROOT, "initiatives", "rules")
INITIATIVES_OUTDIR = os.path.join(DOCS_ROOT, "initiatives")
SAMPLE_POLICIES_REPO = "https://github.com/scribe-public/sample-policies/"


def parse_yaml(file_path):
    """Safely parse a YAML file into a Python dict."""
    with open(file_path, "r") as f:
        try:
            return yaml.safe_load(f) or {}
        except Exception as e:
            print(f"# Error parsing {file_path}: {e}")
            return {}


def ensure_output_dirs():
    """Create the top-level output directories if they don't exist."""
    os.makedirs(INITIATIVES_OUTDIR, exist_ok=True)
    os.makedirs(RULES_OUTDIR, exist_ok=True)

def filepath_to_uses(filepath: str) -> str:
    """
    Translates a file path in the format 'vX/rules/group/.../rule.yaml'
    into a 'uses' reference of the format 'group/.../rule@vX/rules'.

    For example:
      Input:  "v2/rules/sbom/verify-labels.yaml"
      Output: "sbom/verify-labels@v2"
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
    return f"{rule_path}@{version}"

def filter_labels(labels):
    # if starts with "{{- if", remove it
    return [label for label in labels if not label.startswith("{{- if")]
    
def escape_template(value):
    """Escapes template-like values to be shown as string in markdown."""
    # If value is a list, apply escape_template to each item in the list
    # if isinstance(value, list):
    #     return [escape_template(item) for item in value]
    if isinstance(value, list):
        return [escape_template(item) for item in value]
    
    if isinstance(value, dict):
        return f'`{value}`'
    
    if isinstance(value, object):
        # Serliaze the object to string
        value_str = yaml.dump(value, default_flow_style=True)
        if "{{" in value_str:
            return value.replace("{{", "`{{").replace("}}", "}}`")
    
    if isinstance(value, str):
        return value.replace("{{", "`{{").replace("}}", "}}`")
    

            

    # If value is not a string or list, just return it as is
    return value

# Mapping of directory names to sidebar titles and positions
CATEGORY_CONFIG = {
    'initiatives': {
        'label': 'Reference: Policies and Configuration Guide',
        'position': 999
    },
    'rules': {
        'label': 'Rule Configuration',
        'position': 999
    },
    "rules/api": {
        "label": "Scribe API",
        "position": 1,
    },
    "github/api": {
        "label": "GitHub API",
        "position": 1,
    },
    "gitlab/api": {
        "label": "Gitlab API",
        "position": 1,
    },
    "rules/sbom": {
        "label": "SBOM",
        "position": 1,
    },
    "rules/sarif": {
        "label": "SARIF",
        "position": 1,
    },
    "rules/ssdf": {
        "label": "SSDF",
        "position": 1,
    },
    "rules/slsa": {
        "label": "SLSA",
        "position": 1,
    },
}

def create_category_file(directory, label, position):
    """Create a _category_.json file in the specified directory."""
    category_data = {
        'label': label,
        'position': position
    }
    category_file_path = os.path.join(directory, '_category_.json')
    with open(category_file_path, 'w') as f:
        json.dump(category_data, f, indent=2)


def traverse_and_create_rule_category_files():
    """Traverse directories and create _category_.json files where applicable."""
    for root, dirs, files in os.walk(RULES_OUTDIR):
        # Skip the root RULES_OUTDIR directory itself
        if root == RULES_OUTDIR:
            continue
        
        # Extract the last part of the path to determine the directory name
        dir_name = os.path.basename(root)
        
        # Get the second to last part of the path
        parent_dir = os.path.basename(os.path.dirname(root))
        id = f"{parent_dir}/{dir_name}"
        if id in CATEGORY_CONFIG:
            label = CATEGORY_CONFIG[id]['label']
            position = CATEGORY_CONFIG[id]['position']
            create_category_file(root, label, position)
            continue
        else:
            # If the directory is not in CATEGORY_CONFIG, use a default title and position
            title = re.sub(r'\bGithub\b', 'GitHub', dir_name.title())
            create_category_file(root, title, 1)
            continue

def traverse_and_create_category_files():
    """Traverse directories and create _category_.json files where applicable."""
    for root, dirs, files in os.walk(DOCS_ROOT):
        # Skip the root DOCS_ROOT directory itself
        if root == DOCS_ROOT:
            continue
        # Extract the last part of the path to determine the directory name
        dir_name = os.path.basename(root)
        if dir_name in CATEGORY_CONFIG:
            label = CATEGORY_CONFIG[dir_name]['label']
            position = CATEGORY_CONFIG[dir_name]['position']
            create_category_file(root, label, position)

    traverse_and_create_rule_category_files()

# https://deploy-preview-299--scribe-security.netlify.app/docs/guides/enforcing-sdlc-initiative/#sbom-1
table = {
    "SBOM": f"/docs/valint/sbom", # docs/guides/enforcing-sdlc-initiative/#sbom-1
    "SARIF": f"/docs/valint/sarif", # docs/guides/enforcing-sdlc-initiative/#sarif-reports
    "Statement": f"/docs/valint/generic",
    "Image SBOM": f"/docs/valint/sbom", # docs/guides/enforcing-sdlc-initiative/#images
    "Git SBOM": f"/docs/valint/sbom", # docs/guides/enforcing-sdlc-initiative/#git
    "SLSA Provenance": f"/docs/valint/help/valint_slsa", # docs/guides/enforcing-sdlc-initiative/#slsa
    "Discovery Evidence": f"/docs/platforms/discover",
    "SARIF Evidence": f"/docs/valint/sarif", # docs/guides/enforcing-sdlc-initiative/#sarif-reports
    "Generic Statement": f"/docs/valint/generic",
    "Dockerhub Project Discovery Evidence": f"/docs/platforms/discover#dockerhub-discovery",
    "Jenkins Instance Discovery Evidence": f"/docs/platforms/discover#jenkins-discovery",
    "Jenkins Folder Discovery Evidence": f"/docs/platforms/discover#jenkins-discovery",
    "K8s Namespace Discovery Evidence": f"/docs/platforms/discover#k8s-discovery",
    "K8s Pod Discovery Evidence": f"/docs/platforms/discover#k8s-discovery",
    "Gitlab Project Discovery Evidence": f"/docs/platforms/discover#gitlab-discovery",
    "Gitlab Organization Discovery Evidence": f"/docs/platforms/discover#gitlab-discovery",
    "Gitlab Pipeline Discovery Evidence": f"/docs/platforms/discover#gitlab-discovery",
    "Bitbucket Project Discovery Evidence": f"/docs/platforms/discover#bitbucket-discovery",
    "Bitbucket Repository Discovery Evidence": f"/docs/platforms/discover#bitbucket-discovery",
    "Bitbucket Workspace Discovery Evidence": f"/docs/platforms/discover#bitbucket-discovery",
    "Github Organization Discovery Evidence": f"/docs/platforms/discover#github-discovery",
    "Github Repository Discovery Evidence": f"/docs/platforms/discover#github-discovery",
}

high_priority = {
    "SBOM": 1,
    "Image SBOM": 2,
    "Git SBOM": 3,
    "SLSA Provenance": 4,
    "SARIF": 5,
    "SARIF Evidence": 6,
    "Generic Statement": 7,
    "Github Organization Discovery Evidence": 8,
    "Github Repository Discovery Evidence": 9,
    "Gitlab Organization Discovery Evidence": 10,
    "Gitlab Project Discovery Evidence": 11,
    "K8s Namespace Discovery Evidence": 12,
    "K8s Pod Discovery Evidence": 13,

}

def adjust_asset_type(platform, asset_type):
    """
    Adjusts the asset type based on the platform.
    For Gitlab, 'project' is used instead of 'repo'.
    """
    if platform == None or asset_type == None:
        return asset_type
    match platform:
        case "gitlab":
            if asset_type == "repo":
                return "project"
            else:
                return asset_type
        case "github":
            if asset_type == "repo":
                return "repository"
            else:
                return asset_type
        case "bitbucket":
            if asset_type == "repo":
                return "repository"
            else:
                return asset_type
        case "dockerhub":
            if asset_type == "registry":
                return "namespace"
            elif asset_type == "oci_repo":
                return "project"
            else:
                return asset_type
        case _:
            return asset_type


def get_evidence_type(evidence, file_name):
    signed = evidence.get("signed", False)
    content_body_type = evidence.get("content_body_type", "")
    target_type = evidence.get("target_type", None)
    predicate_type = evidence.get("predicate_type", None)
    labels = evidence.get("labels", None)
    
    if content_body_type == "cyclonedx-json":
        if target_type == "container":
            evidence_type = "Image SBOM"
        elif target_type == "git":
            evidence_type = "Git SBOM"
        else:
            evidence_type = "SBOM"
    elif content_body_type == "slsa":
        evidence_type = "SLSA Provenance"
    elif content_body_type == "generic":
        if predicate_type == "http://scribesecurity.com/evidence/discovery/v0.1":
            platform = evidence.get("asset_platform", None)
            asset_type = adjust_asset_type(platform, evidence.get("asset_type", None))
            if platform and asset_type:
                evidence_type = f"{platform.capitalize()} {asset_type.capitalize()} Discovery Evidence"
            elif platform:
                evidence_type = f"{platform.capitalize()} Discovery Evidence"
            else:
                evidence_type = "Discovery Evidence"
        elif predicate_type == "http://docs.oasis-open.org/sarif/sarif/2.1.0":
            evidence_type = "SARIF Evidence"
        else:
            evidence_type = "Generic Statement"
    else:
        evidence_type = "Statement"
        print("# Warning - Unknown Evidence Type:", evidence, evidence_type, file_name)
    

    return evidence_type, signed

def create_rule_string_from_evidence(evidence, file_name, skip_evidence, require_scribe_api):
    """
    Generate a descriptive string for the evidence requirement based on the default evidence fields.
    
    Reads the following fields from the evidence dictionary:
      - signed
      - content_body_type
      - target_type
      - predicate_type
      - labels (if available)
    
    Returns a string describing the evidence requirement.
    """
    if skip_evidence or require_scribe_api:
        return ""

    evidence_type, signed = get_evidence_type(evidence, file_name)
    
    signed_str = "Signed " if signed else ""

    evidence_link = f" See [here]({table[evidence_type]}) for more details." if evidence_type in table else ""
    return f"This rule requires {signed_str}{evidence_type}.{evidence_link}"


def generate_parameters_table(rule_data):
    try:
        """
        Generates a Markdown table for rule parameters.
        If the rule YAML contains an 'inputs' field (a list of input definitions),
        an extended table is produced with columns: Parameter, Type, Required, and Description.
        Otherwise, a simpler table is generated using the 'with' block.
        """
        md_lines = []
        inputs_def = rule_data.get("inputs", [])
        if inputs_def:
            md_lines.append("## Input Definitions  ")
            md_lines.append("| Parameter | Type | Required | Description |")
            md_lines.append("|-----------|------|----------|-------------|")
            for inp in inputs_def:
                param = inp.get("name", "")
                inp_type = inp.get("type", "")
                required = inp.get("required", False)
                desc = inp.get("description", "")
                md_lines.append(f"| {param} | {inp_type} | {required} | {desc} |")
            md_lines.append("")
        else:
            with_block = rule_data.get("with", {})
            if with_block:
                md_lines.append("## Rule Parameters (`with`)  ")
                md_lines.append("| Parameter | Default |")
                md_lines.append("|-----------|---------|")
                for param, value in with_block.items():
                    md_lines.append(f"| {param} | {escape_template(value)} |")
                md_lines.append("")
        return "\n".join(md_lines)
    except Exception as e:
        print(f"# Error generating parameters table: {e} {rule_data}")
        raise e

def generate_rule_markdown(rule_data, file_path, file_name, base_source_git):
    """
    Given the YAML data for a rule, produce the Markdown content as a string.
    The doc will be written to a mirrored subdirectory under docs/v2/rules.
    This version uses two trailing spaces to force Markdown line breaks.
    """

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
    
    front_matter = {
        'sidebar_label': name,
        'title': name
    }
    front_matter_yaml = yaml.dump(front_matter, default_flow_style=False).strip()

    md = []
    md.append(f"---\n{front_matter_yaml}\n---  ")
    
    md.append(f"# {name}  ")
    md.append(f"**Type:** Rule  ")
    md.append(f"**ID:** `{rule_id}`  ")
    # md.append(f"**Uses:** `{filepath_to_uses(file_path)}`  ")
    md.append(f"**Source:** [{file_path}]({yaml_source_link})  ")
    if rego_path:
        md.append(f"**Rego Source:** [{rego_path}]({rego_source_link})  ")
    if help_url:
        md.append(f"**Help:** {help_url}  ")
    if labels:
        md.append(f"**Labels:** {', '.join(labels)}  ")

    md.append(f"\n{description}")
    md.append("")



    skip_evidence = rule_data.get("skip-evidence", False)
    fail_on_missing = rule_data.get("fail-on-missing-evidence", False)
    require_scribe_api = rule_data.get("require-scribe-api", False)
    # else:
    #     md.append(f":::tip ")
    #     md.append(f"Rule Result will be set as 'open' if evidence is missing.  ")
    #     md.append(f"::: ")


    evidence_str = create_rule_string_from_evidence(rule_data.get("evidence", {}), file_path, skip_evidence, require_scribe_api)
    if evidence_str != "":
        md.append(f":::note ")
        md.append(f"{evidence_str}  ")
        md.append(f"::: ")

    extra_notes = rule_data.get("notes", [])
    for note in extra_notes:
        md.append(f":::note ")
        md.append(f"{note}  ")
        md.append(f"::: ")


    if skip_evidence:
        md.append(f":::tip ")
        md.append(f"Evidence **IS NOT** required for this rule.  ")
        md.append(f"::: ")

    if fail_on_missing:
        md.append(f":::tip ")
        md.append(f"> Evidence **IS** required for this rule and will fail if missing.  ")
        md.append(f"::: ")
        
    if require_scribe_api:
        md.append(f":::tip ")
        md.append(
            f"Rule requires the Scribe API to be enabled. Ensure that you provide the Scribe Token to the `valint` utility.  ")
        md.append(f"::: ")

    sign_defaults = rule_data.get("evidence", {}).get("signed", False)

    if not skip_evidence:
        if sign_defaults:
            md.append(f":::tip ")
            md.append(f"Signed Evidence for this rule **IS** required by default.  ")
            md.append(f"::: ")
        else:
            md.append(f":::tip ")
            md.append(f"Signed Evidence for this rule **IS NOT** required by default but is recommended.  ")
            md.append(f"::: ")

    filter_by = rule_data.get("evidence", {}).get("filter-by", [])
    if (not skip_evidence) and ((not filter_by) or ("target" in [s.lower() for s in filter_by])):
        md.append(f":::warning  ")
        md.append("Rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.")
        # This rule requires evaluation with a target. Without one, it will be **disabled** unless the `--all-evidence` flag is provided.
        md.append(f"::: ")

    # Create a list seperated by , and last one seperated by "and"
    if len(filter_by) > 0:
        filter_by_md = ", ".join(filter_by[:-1]) + " and " + filter_by[-1] if len(filter_by) > 1 else filter_by[0]
        md.append(f":::info  ")
        md.append(f"Rule is scoped by {filter_by_md}.  ")
        md.append(f":::  ")

    input_example = rule_data.get("input_example", "")
    md.append(f"\n## Usage example\n")
    md.append("```yaml")
    md.append(f"uses: {filepath_to_uses(file_path)}")
    if input_example:
        md.append("with:")
        for line in input_example.split('\n'):
            md.append(f"  {line}")
    md.append("```")

    if mitigation:
        md.append("\n## Mitigation  ")
        md.append(mitigation)
        md.append("")

    if full_description:
        md.append("\n## Description  ")
        # md.append(full_description)
        split_line = full_description.split("\n")
        for line in split_line:
            md.append(line)
        md.append("")
    else:
        md.append("")

    evidence = rule_data.get("evidence", {})
    if evidence:
        templated_values = []
        md.append("## Evidence Requirements  ")
        md.append("| Field | Value |")
        md.append("|-------|-------|")
        for field, value in evidence.items():
            if field == "labels":
                
                filtered_labels = filter_labels(value)
                # Create a list of labels
                list_md = "<br/>".join([f"- {label}" for label in filtered_labels])
                value = list_md
            if isinstance(value, str) and value.startswith("{{"):
                templated_values.append(value)
                value = f"Template value (see below)"
            md.append(f"| {field} | {value} |")
        md.append("")
        if len(templated_values) > 1:
            md.append(
                f"**Template Values** (see [here](/docs/valint/initiatives#template-arguments) for more details)\n")
        elif len(templated_values) == 1:
            md.append(
                f"**Template Value** (see [here](/docs/valint/initiatives#template-arguments) for more details)\n")
        for templated_value in templated_values:
            md.append(f"```")
            md.append(re.sub(r'}}\s+{{', '}}\n{{', templated_value))
            md.append("```")
            md.append("")

    # Generate the parameters table (extended or simple) using a helper function.
    parameters_table = generate_parameters_table(rule_data)
    if parameters_table:
        md.append(parameters_table)
                  
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

    return f"{norm_github_repo}/blob/main"

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
        "base_name": base_name,
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

def id_from_name(input_str):
    """
    Generate a control ID from the given string by replacing hyphens with spaces and converting to title case.
    """
    beautified = input_str.replace("-", " ")
    return beautified.title()


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
    defaults = initiative_data.get("defaults", {})
    source_link = os.path.join(base_source_git, file_path)
    md = []

    # Workaround for SSPB-GL/SSPB-GH initiatives sidebar names
    sidebar_name = name
    if init_id.endswith("-GL"):
        sidebar_name = f"{name} for Gitlab"
    elif init_id.endswith("-GH"):
        sidebar_name = f"{name} for GitHub"

    front_matter = {
        'sidebar_label': sidebar_name,
        'title': name
    }
    front_matter_yaml = yaml.dump(front_matter, default_flow_style=False).strip()

    md = []
    md.append(f"---\n{front_matter_yaml}\n---  ")
  
    # Initiative header
    md.append(f"# {name}  ")
    md.append(f"**Type:** Initiative  ")
    md.append(f"**ID:** `{init_id}`  ")
    md.append(f"**Version:** `{version}`  ")
    md.append(f"**Bundle-Version:** `{bundle_version}`  ")
    md.append(f"**Source:** [{file_path}]({source_link})  ")
    if help_url:
        md.append(f"**Help:** {help_url}  ")

    md.append(f"\n{description}")
    md.append("")

    if mitigation:
        md.append("\n## Mitigation  ")
        md.append(mitigation)
        md.append("")



    # sign_defaults = initiative_data.get("defaults", {}).get("evidence", {}).get("signed", False)
    # if sign_defaults:
    #     md.append(f":::tip  ")
    #     md.append(f"Evidence for this initiative **IS** required by default.**  ")
    #     md.append(f":::  ")
    # else:
    #     md.append(f":::tip  ")
    #     md.append(f"Evidence for this initiative **IS NOT** required by default but is recommended.  ")
    #     md.append(f":::  ")

    if full_description:
        md.append(f"## **Description**\n")
        split_line = full_description.split("\n")
        for line in split_line:
            md.append(line)
        md.append("")

    controls = initiative_data.get("controls", [])
    if not controls:
        md.append("_No controls defined._")
        return "\n".join(md)

    ev_list = {}
    default_signed = False
    if "evidence" in defaults:
        if "signed" in defaults["evidence"]:
            default_signed = defaults["evidence"].get("signed", False)
    for ctrl in controls:
        ctrl_rules = ctrl.get("rules", [])
        for rule_ref in ctrl_rules:
            r_uses = rule_ref.get("uses", "")
            if r_uses:
                # e.g. "gitlab/org/max-admins"
                before_at = r_uses.split("@")[0]
                subdirs, base_name = os.path.split(before_at)
                key_for_map = os.path.join(
                    subdirs, base_name) if subdirs else base_name

                if key_for_map in rule_docs_map:
                    rule_info = rule_docs_map[key_for_map]
                    rule_yaml = rule_info["yaml_data"]
                    skip_evidence = rule_yaml.get("skip-evidence", False)
                    evidence_req = rule_yaml.get("evidence", {})
                    if not skip_evidence:
                        evidence_type, signed = get_evidence_type(evidence_req, "")
                        if default_signed:
                            signed = default_signed
                        signed_str = "Signed " if signed else ""
                        link = f"{table[evidence_type]}" if evidence_type in table else ""
                        ev_list[f"{signed_str}{evidence_type}"] = link

    def sort_key(item):
        # item is a tuple: (key, value)
        name = item[0]
        is_signed = name.startswith("Signed ")
        base_name = name.removeprefix("Signed ").strip()
        priority = high_priority.get(base_name)
        if priority is not None:
            # Sort by priority, then unsigned before signed
            return (0, priority, is_signed)
        # Unknown values sorted after, by base_name, then unsigned before signed, then full name
        return (1, base_name, is_signed, name)

    if len(ev_list) > 0:
        md.append("## Evidence Requirements\n")
        md.append("This initiative requires the following evidence types:\n")
        for ev, link in sorted(ev_list.items(), key=sort_key):
            if link:
                md.append(f"- [{ev}]({link})")
            else:
                md.append(f"- {ev}")
        md.append("")

    if defaults and "evidence" in defaults:
        # Build default table for each field in "evidence"
        md.append("## Evidence Defaults\n")
        md.append("| Field | Value |")
        md.append("|-------|-------|")
        for field, value in defaults["evidence"].items():
            md.append(f"| {field} | {value} |")
        md.append("")
    

    # Controls Overview with Mitigation column
    md.append("## Controls Overview\n")
    md.append("| Control Name | Control Description | Mitigation |")
    md.append("|--------------|---------------------|------------|")
    for ctrl in controls:
        ctrl_id = ctrl.get("id", "")
        
        ctrl_name = ctrl.get("name", ctrl_id)
        if ctrl_id == "" and ctrl_name != "":
            print(f"# Warning: 'id' field is missing for control '{ctrl_name}' in {file_path}")

        if ctrl_name == "" and ctrl_id != "":
            print(f"# Warning: 'name' field is missing for control '{ctrl_id}' in {file_path}")

        if ctrl_name != "":
            ctrl_section_link = generate_markdown_anchor(f"{ctrl_name}")
            link_name = ctrl_name
            link_custom_name = ctrl_name
            if ctrl_id != "":
                ctrl_section_link = generate_markdown_anchor(f"{ctrl_id} {ctrl_name}")
                print(link_custom_name, ctrl_id)
                if link_custom_name.startswith(ctrl_id):
                    print(f"# Info: Removing control ID from control name {link_custom_name}")
                    link_custom_name = link_custom_name.strip(ctrl_id)

                link_name = f"[{ctrl_id}] {link_custom_name}"
            link = f"[{link_name}]({ctrl_section_link})"
        elif ctrl_id != "":
            ctrl_section_link = generate_markdown_anchor(f"{ctrl_id} {ctrl_name}")
            link = f"[{ctrl_id}]({ctrl_section_link})"

        ctrl_desc = ctrl.get("description", "")
        ctrl_mitigation = ctrl.get("mitigation", "")
        md.append(f"| {link} | {ctrl_desc} | {ctrl_mitigation} |")
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

        if ctrl_id != "":
            md.append(f"## [{ctrl_id}] {ctrl_name}")
        else:
            md.append(f"## {ctrl_name}")

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

        # Filter out rules with id == "demodata/data@experimental"
        # If control consists only of this rule, it means it's not supported yet
        implemented_rules = [rule for rule in ctrl_rules if rule.get("uses", "") != "demodata/data@experimental"]
        if not implemented_rules:
            md.append(f":::warning  ")
            md.append("This control not currently supported on this platform.")
            md.append(f"::: \n")
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
                    
                    link_doc = f"[{final_r_id}]({rel_path_from_initiatives})"
                    link_md = f"[{final_r_name}]({rel_path_from_initiatives})"
                else:
                    link_md = r_uses
                    link_doc = r_uses
            else:
                link_md = final_r_name
                link_doc = final_r_id

            row = f"| {link_doc} | {link_md} | {final_r_desc} |"
            md.append(row)
        md.append("")
    return "\n".join(md)


def write_initiative_doc(file_path, initiative_data, rule_docs_map, base_source_git):
    """
    Write the initiative doc to docs/v2/initiatives/<original_filename>.md.
    For example, if the initiative file is "slsa.l2.yaml", the doc will be "slsa.l2.md".
    """
    print("# Writing initiative doc:", file_path)
    base_file = os.path.basename(file_path)
    base_no_ext = os.path.splitext(base_file)[0]

    out_md_path = os.path.join(INITIATIVES_OUTDIR, base_no_ext + ".md")
    os.makedirs(INITIATIVES_OUTDIR, exist_ok=True)

    doc_content = generate_initiative_markdown(initiative_data, file_path, base_file, rule_docs_map, base_source_git)
    with open(out_md_path, "w") as f:
        f.write(doc_content)

    return os.path.abspath(out_md_path)

def create_rules_index_md(rule_docs_map):
    """
    Create a rules index markdown file (index.md) with a table of rules.
    
    The table has the following columns:
      - Rule Name: the rule's title
      - Description: the rule's description
      - Evidence Type: a short evidence type label (with a link to documentation)
      
    The rows are ordered by evidence type using high_priority for groups that should come first.
    """
    index_file_path = os.path.join(RULES_OUTDIR, "index.md")
    index_rows = []
    
    for key, doc_info in rule_docs_map.items():
        rule_data = doc_info["yaml_data"]
        rule_name = rule_data.get("name", key)
        description = rule_data.get("description", "")
        evidence = rule_data.get("evidence", {})
        evidence_type, signed = get_evidence_type(evidence, rule_name)
        evidence_link = f" See [here]({table[evidence_type]}) for more details." if evidence_type in table else ""

        index_rows.append((evidence_type, rule_name, description, evidence_link))
    
    # Use high_priority to sort the high priority groups at the top
    def sort_key(row):
        ev_type = row[0]
        if ev_type in high_priority:
            return (0, high_priority[ev_type])
        else:
            return (1, ev_type.lower())
    
    index_rows.sort(key=sort_key)
    
    md_lines = []
    md_lines.append("# Rule Index")
    md_lines.append("")
    md_lines.append("| Rule Name | Description | Evidence Type |")
    md_lines.append("|-----------|-------------|---------------|")
    for _, rule_name, description, evidence_link in index_rows:
        md_lines.append(f"| {rule_name} | {description} | {evidence_link} |")
    
    md_content = "\n".join(md_lines)
    with open(index_file_path, "w") as f:
        f.write(md_content)
    
    print(f"Created rules index at {index_file_path}")

def create_combined_index_md(initiative_docs, rule_docs_map):
    """
    Create a combined index markdown file at initiatives/index.md with two sections:
    
    1. Initiatives – a table with columns:
         - Name (linked to the doc site, e.g. "docs/initiative/<file.md>")
         - Description
    2. Rules – a set of tables grouped by evidence type, each with columns:
         - Rule Name (as a link to its rule doc)
         - Description
         
    Each group will have its own subsection, and the evidence type and link will be in the table header.
    """
    index_file_path = os.path.join(INITIATIVES_OUTDIR, "index.md")
    md_lines = []
    
    # Overall header
    md_lines.append("# Documentation Index")
    md_lines.append("")
    
    # Initiatives Section
    md_lines.append("## Initiatives")
    md_lines.append("")
    md_lines.append(f"<!-- START TABLE -->")
    md_lines.append("| Name | Description |")
    md_lines.append("|------|-------------|")
    for doc in sorted(initiative_docs, key=lambda x: x['name']):
        # Build a link to the initiative doc at "docs/initiative/<file.md>"
        link = f"[{doc['name']}](/docs/configuration/initiatives/{doc['file']})"
        # Replace newlines in description with a space to avoid breaking the table.
        description = doc['description'].replace("\n", " ")
        md_lines.append(f"| {link} | {description} |")
    md_lines.append("")
    
    # Rules Section
    md_lines.append("## Rules")
    md_lines.append("")
    
    index_rows = []
    for key, doc_info in rule_docs_map.items():
        rule_data = doc_info["yaml_data"]
        rule_name = rule_data.get("name", key)
        description = rule_data.get("description", "").replace("\n", " ")
        evidence = rule_data.get("evidence", {})
        evidence_type, signed = get_evidence_type(evidence, rule_name)
        evidence_link = f"[{evidence_type}]({table[evidence_type]})" if evidence_type in table else evidence_type
        # Get the relative path for the rule doc (e.g. "gitlab/org/max-admins.md")
        rel_path = doc_info["rel_path"]
        # Create a link to the rule doc relative to the initiatives folder.
        rule_link = f"[{rule_name}](/docs/configuration/initiatives/rules/{rel_path})"
        index_rows.append((evidence_type, rule_link, description, evidence_link))
    
    # Sort rules: prioritized groups first (using high_priority) then alphabetically.
    def sort_key(row):
        ev_type = row[0]
        if ev_type in high_priority:
            return (0, high_priority[ev_type])
        else:
            return (1, ev_type.lower())
    index_rows.sort(key=sort_key)
    
    # Group rules by evidence type
    grouped_rules = {}
    for evidence_type, rule_link, description, evidence_link in index_rows:
        if evidence_type not in grouped_rules:
            grouped_rules[evidence_type] = []
        grouped_rules[evidence_type].append((rule_link, description, evidence_link))
    
    # Generate tables for each evidence type group
    for evidence_type, rules in grouped_rules.items():
        md_lines.append(f"### {evidence_type}")
        md_lines.append(f"**Evidence Type:** {rules[0][2]}")
        md_lines.append("")
        md_lines.append("| Rule Name | Description |")
        md_lines.append("|-----------|-------------|")
        for rule_link, description, _ in rules:
            md_lines.append(f"| {rule_link} | {description} |")
        md_lines.append("")

    md_lines.append(f"<!-- END TABLE -->")
    
    md_content = "\n".join(md_lines)
    with open(index_file_path, "w") as f:
        f.write(md_content)
    
    print(f"Created combined index at {index_file_path}")

def main():
    ensure_output_dirs()

    rule_files = []        # list of (file_path, rule_yaml_data)
    initiative_files = []  # list of (file_path, initiative_yaml_data)

    base_source_git = get_current_repo_context()

    for dirpath, _, filenames in os.walk("v2"):
        for filename in filenames:
            if not filename.endswith(".yaml") and not filename.endswith(".yml"):
                continue
            full_path = os.path.join(dirpath, filename)

            data = parse_yaml(full_path)
            ctype = data.get("config-type", "").lower()
            if ctype == "rule":
                rule_files.append((full_path, data))
            elif ctype == "initiative":
                initiative_files.append((full_path, data))
            else:
                print("# Warning: Unknown config type in", full_path, ctype)
                print("# JSON", json.dumps(data, indent=2))
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

    initiative_docs = []
    for file_path, i_data in initiative_files:
        out_path = write_initiative_doc(file_path, i_data, rule_docs_map, base_source_git)
        base_file = os.path.basename(out_path)  # e.g. "slsa.l2.md"
        name = i_data.get("name", os.path.splitext(base_file)[0])
        description = i_data.get("description", "")
        initiative_docs.append({
            "name": name,
            "description": description,
            "file": base_file
        })

    traverse_and_create_category_files()
    create_combined_index_md(initiative_docs, rule_docs_map)
    print("[OK] Documentation has been generated under docs/v2/")


if __name__ == "__main__":
    main()
