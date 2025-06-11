package verify

import future.keywords.in

default allow := false

default violations := []

default severities := []
default titles := []
default cwes := []
default descriptions := []
default descriptions_to_ignore := []
default component_names := []

severities = input.config.args.severities
titles = input.config.args.titles
cwes = input.config.args.cwes
descriptions = input.config.args.descriptions
descriptions_to_ignore = input.config.args.descriptions_to_ignore
component_names = input.config.args.component_names

short_description = "Verify 3rd party vulnerability scans"

description = "Verify no violations in 3rd party scanner reports by a custom rule"

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "Invalid Unified Report",
			"details": violations,
		},
		"short_description": short_description,
		"description": description,
		"summary": [{
			"allow": allow,
			"reason": reason,
			"violations": count(violations),
		}],
	}
}

reason = v {
	v := sprintf("%d violations | 0 max allowed", [count(violations)])
}

allow {
	count(violations) == 0
}

get_field(result, field_name) := value {
    result[field_name]
    value := result[field_name]
}

get_field(result, field_name) := value {
    not result[field_name]
    value := sprintf("%s not specifield", [field_name])
}

violations = [j |
    some result in input.evidence.predicate.content
    filtered_result(result)
    j = {
        "title": get_field(result, "title"),
        "severity": get_field(result, "severity"),
        "cwe": get_field(result, "cwe"),
        "description": get_field(result, "description"),
        "component_name": get_field(result, "component_name"),
        "file_path": get_field(result, "file_path"),
    }
]

severity_check(result, severities) {
    count(severities) == 0
}

severity_check(result, severities) {
    not result.severity
}

severity_check(result, severities) {
    count(severities) != 0
    result.severity in severities
}

title_check(result, titles) {
    count(titles) == 0
}

title_check(result, titles) {
    not result.title
}

title_match_any(result, titles) {
    some title_regex in titles
    regex.match(title_regex, result.title)
}

title_check(result, titles) {
    count(titles) != 0
    result.title
    title_match_any(result, titles)
}

cwe_check(result, cwes) {
    count(cwes) == 0
}

cwe_check(result, cwes) {
    not result.cwe
}

cwe_match_any(result, cwes) {
    some cwe in cwes
    cwe == result.cwe
}

cwe_check(result, cwes) {
    count(cwes) != 0
    result.cwe
    cwe_match_any(result, cwes)
}

description_check(result, descriptions) {
    count(descriptions) == 0
}

description_check(result, descriptions) {
    not result.description
}

description_match_any(result, descriptions) {
    some description_regex in descriptions
    regex.match(description_regex, result.description)
}

description_check(result, descriptions) {
    count(descriptions) != 0
    result.description
    description_match_any(result, descriptions)
}

ignored_description_check(result, descriptions_to_ignore) {
    count(descriptions_to_ignore) == 0
}

ignored_description_check(result, descriptions_to_ignore) {
    not result.description
}

ignored_description_match_any(result, descriptions_to_ignore) {
    some description_regex in descriptions_to_ignore
    regex.match(description_regex, result.description)
}

ignored_description_check(result, descriptions_to_ignore) {
    count(descriptions_to_ignore) != 0
    result.description
    not ignored_description_match_any(result, descriptions_to_ignore)
}

component_name_check(result, component_names) {
    count(component_names) == 0
}

component_name_check(result, component_names) {
    not result.component_name
}

component_name_match_any(result, component_names) {
    some component_name_regex in component_names
    regex.match(component_name_regex, result.component_name)
}

component_name_check(result, component_names) {
    count(component_names) != 0
    result.component_name
    component_name_match_any(result, component_names)
}

filtered_result(result) {
    severity_check(result, severities)
    title_check(result, titles)
    cwe_check(result, cwes)
    description_check(result, descriptions)
    ignored_description_check(result, descriptions_to_ignore)
    component_name_check(result, component_names)
}
