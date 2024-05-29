package verify

import future.keywords.in

default allow := false

default violations := []


short_description = "Verify a unified report"

description = "Verify a unified report against a set of rules"

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

violations = j {
	j := {r |
        some result in input.evidence.predicate.content
        filtered_result(result)
        r = {
            "title": get_field(result, "title"),
            "severity": get_field(result, "severity"),
            "cwe": get_field(result, "cwe"),
            "description": get_field(result, "description"),
            "component_name": get_field(result, "component_name"),
        }
	}
}

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
    result.severity
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
    severity_check(result, input.config.args.severities)
    title_check(result, input.config.args.titles)
    cwe_check(result, input.config.args.cwes)
    description_check(result, input.config.args.descriptions)
    component_name_check(result, input.config.args.component_names)
}
