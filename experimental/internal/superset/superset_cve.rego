package verify

import data.superset
import future.keywords.every
import future.keywords.in

default allow = false

default violations = []

default real_violations = []

default params = []

default format_target_name = ""

default raw_target_name = ""

default raw_target_tag = ""

default max = 0

default severity = 0

default product_name = ""

default product_version = ""

default component_name = ""

default component_version = ""

default apply_target_filter = false

default query_text = ""

default raw_input_text = ""

config = superset.config

args = superset.args.cve

max = args.max

verifier = superset.verifier

component_name = args.component_name {
	args.component_name != null
}

component_version = args.component_version {
	args.component_version != null
}

severity = args.severity

context = superset.context

product_name = context.name {
	context.name
	context.name != null
	context.name != ""
}

product_version = adjust_version(context.product_version) {
	context.product_version
	context.product_version != null
	context.product_version != ""
}

adjust_version(version) := adjusted {
	adj := lower(version)
	adjusted := regex.replace(adj, "[^a-zA-Z0-9:.]+", "_")
}

verify := v {
	v := {
		"allow": allow,
		"violation": {
			"type": "CVE",
			"details": violations,
		},
		"summary": [summary],
		"errors": superset.errors | errors,
	}
}

id := superset.datasetID("dataset_API_Vulnerabilities")

policyQuery := v {
	queryRes := query(id)
	appNamedQuery := append_appname_filter(queryRes, product_name)
	appVersionedQuery := append_appversion_filter(appNamedQuery, product_version)
	componentNamedQuery := append_component_name_filter(appVersionedQuery, component_name)
	targetQuery := append_target_filter(componentNamedQuery)
	v := append_component_version_filter(targetQuery, component_version)
}

queryResponse := v {
	v := superset.Query(config, policyQuery)
}


errors[msg] {
	not id
	msg := "couldn't get datasets"
}

errors[msg] {
	id
	not policyQuery
	msg := sprintf("couldn't create a query for product %s:%s", [product_name, product_version])
}

errors[msg] {
	not queryResponse
	actualResponse := superset.QueryPrepare(config, policyQuery)
	msg := sprintf("no result in API response: %s", [actualResponse.body])
}

errors[msg] {
	queryResponse
	not queryResponse[0].colnames
	msg := sprintf("malformed result in API response: %s", [queryResponse[0]])
}

# errors[msg] {
# 	queryResponse[0]
# 	queryResponse[0].colnames
# 	count(queryResponse[0].colnames) == 0
# 	msg := sprintf("empty result in API response, %s:%s, %s", [product_name, product_version, policyQuery])
# }

allow {
	queryResponse
	count(violations) <= max
}

dup_violations = queryResponse[0].data

exists_before(i, id) {
    some j
    j < i
    dup_violations[j].vulnerability_id == id
}

real_violations := [violation |
	some i
	violation = dup_violations[i]
	id := violation.vulnerability_id
    not exists_before(i, id)  # Ensure unique keys
]

params := [{
	"query": policyQuery,
	"format_target_name": format_target_name,
	"raw_target_name": raw_target_name,
	"raw_target_tag": raw_target_tag,
	}]

# violations := array.concat(params, real_violations)
# violations := dup_violations
# violations := params

violations := real_violations

query_text := json.marshal_with_options(policyQuery, {"indent": " "})
raw_input_text := json.marshal_with_options(raw_input, {"indent": " "})

summary = {
	"allow": allow,
	"reason": reason,
	"violations": count(violations),
	"details": sprintf("query: %s\nraw_input: %s", [query_text, raw_input_text]),
}

reason = v {
	allow
	v := sprintf("pass cve policy, failed: %d, max: %d", [count(violations), max])
}

reason = v {
	not allow
	count(violations) != 0
	v := sprintf("fail cve policy, failed: %d, max: %d", [count(violations), max])
}

reason = v {
	not allow
	count(violations) == 0
	v := "cve policy failed due to API errors"
}

query(id) := {
	"datasource": {
		"id": id,
		"type": "table",
	},
	"force": true,
	"queries": [{
		"columns": [
			"vulnerability_id",
			"final_severity",
			"advisory_text",
			"advisory_status",
			"advisory_justification",
			"source_layer",
			"cvss_score",
			"hyper_links",
			"component_name",
			"component_version",
			"targetName",
			"pipeline_run_id"
		],
		"filters": [
			{
				"col": "final_severity",
				"op": ">=",
				"val": severity,
			},
		],
		"metrics": [],
		"row_limit": 0
	}],
	"result_format": "json",
	"result_type": "results"
}

append_appname_filter(q, appName) := q2 {
	appName != ""
	filters := array.concat(q.queries[0].filters, [{"col": "logical_app", "op": "==", "val": appName}])
	q2 := {
		"datasource": q.datasource,
		"force": q.force,
		"queries": [{
			"columns": q.queries[0].columns,
			"filters": filters,
			"metrics": q.queries[0].metrics,
			"row_limit": q.queries[0].row_limit,
		}],
		"result_format": q.result_format,
		"result_type": q.result_type,
	}
}

append_appname_filter(q, appName) := q2 {
	appName == ""
	q2 = q
}

append_appversion_filter(q, appVersion) := q2 {
	appVersion != ""
	filters = array.concat(q.queries[0].filters, [{"col": "logical_app_version", "op": "==", "val": appVersion}])
	q2 := {
		"datasource": q.datasource,
		"force": q.force,
		"queries": [{
			"columns": q.queries[0].columns,
			"filters": filters,
			"metrics": q.queries[0].metrics,
			"row_limit": q.queries[0].row_limit,
		}],
		"result_format": q.result_format,
		"result_type": q.result_type,
	}
}

append_appversion_filter(q, appVersion) := q2 {
	appVersion == ""
	q2 = q
}

append_component_name_filter(q, componentName) := q2 {
	componentName != ""
	filters := array.concat(q.queries[0].filters, [{"col": "component_name", "op": "==", "val": componentName}])
	q2 := {
		"datasource": q.datasource,
		"force": q.force,
		"queries": [{
			"columns": q.queries[0].columns,
			"filters": filters,
			"metrics": q.queries[0].metrics,
			"row_limit": q.queries[0].row_limit,
		}],
		"result_format": q.result_format,
		"result_type": q.result_type,
	}
}

append_component_name_filter(q, componentName) := q2 {
	componentName == ""
	q2 = q
}

append_component_version_filter(q, componentVersion) := q2 {
	componentVersion != ""
	filters = array.concat(q.queries[0].filters, [{"col": "component_version", "op": "==", "val": componentVersion}])
	q2 := {
		"datasource": q.datasource,
		"force": q.force,
		"queries": [{
			"columns": q.queries[0].columns,
			"filters": filters,
			"metrics": q.queries[0].metrics,
			"row_limit": q.queries[0].row_limit,
		}],
		"result_format": q.result_format,
		"result_type": q.result_type,
	}
}

append_component_version_filter(q, componentVersion) := q2 {
	componentVersion == ""
	q2 = q
}

append_target_filter(q) := q2 {
	not apply_target_filter
	q2 = q
}

append_target_filter(q) := q2 {
	apply_target_filter
	target_name := format_target_name
	filters = array.concat(q.queries[0].filters, [{"col": "targetName", "op": "==", "val": target_name}])
	q2 := {
		"datasource": q.datasource,
		"force": q.force,
		"queries": [{
			"columns": q.queries[0].columns,
			"filters": filters,
			"metrics": q.queries[0].metrics,
			"row_limit": q.queries[0].row_limit,
		}],
		"result_format": q.result_format,
		"result_type": q.result_type,
	}
}

## Find out if we filter by target

apply_target_filter_args {
	args.input_name != ""
}

apply_target_filter_verifier {
	not apply_target_filter_args
	verifier.input_name != ""
}

apply_target_filter = true {
	apply_target_filter_verifier
}

apply_target_filter = true {
	apply_target_filter_args
}

format_target_name = target_name {
	not apply_target_filter
	target_name := "NO NAME"
}

## Copy everything to raw_input

raw_input.input_name = args.input_name {
	apply_target_filter_args
	args.input_name != ""
}

raw_input.input_name = verifier.input_name {
	apply_target_filter_verifier
	verifier.input_name != ""
}

raw_input.input_tag = args.input_tag {
	apply_target_filter_args
	args.input_tag != ""
}

raw_input.input_tag = verifier.input_tag {
	apply_target_filter_verifier
	verifier.input_tag != ""
}

raw_input.tag = args.tag {
	apply_target_filter_args
	count(args.tag) > 0
}

raw_input.tag = verifier.tag {
	apply_target_filter_verifier
	count(verifier.tag) > 0
}

## Get target name
domain_regex = `^[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)+(?:\.[a-zA-Z0-9-]+)+/(.+)`

clear_domain_name(target) = result_target {
	not regex.match(domain_regex, target)
	result_target := target
}

clear_domain_name(target) = result_target {
	regex.match(domain_regex, target)
	result_target := regex.find_all_string_submatch_n(domain_regex, target, 2)[0][1]
}
raw_target_name = target_name {
	apply_target_filter
	target_name := clear_domain_name(raw_input.input_name)
}

## Get target tag
semver_regex := `v?([0-9]+)(\.[0-9]+)?(\.[0-9]+)?(-([0-9A-Za-z\-]+(\.[0-9A-Za-z\-]+)*))?(\+([0-9A-Za-z\-]+(\.[0-9A-Za-z\-]+)*))?`

find_semver_tag {
	some tag in raw_input.tag
	regex.match(semver_regex, tag)
}

valid_tags {
	raw_input
	raw_input.tag
	count(raw_input.tag) > 0
}

raw_target_tag = target_tag {
	apply_target_filter
	valid_tags
	find_semver_tag

	some tag in raw_input.tag
	regex.match(semver_regex, tag)
	target_tag := tag
}

raw_target_tag = target_tag {
	apply_target_filter
	valid_tags
	not find_semver_tag
	target_tag := substring(raw_input.tag[0], 0, 10)
}

raw_target_tag = target_tag {
	apply_target_filter
	not valid_tags
	target_tag := substring(raw_input.input_tag, 0, 10)
}

## Format target name:tag
format_target_name = target_name {
	apply_target_filter
	contains(raw_target_name, ":")
	target_name := raw_target_name
}

format_target_name = target_name {
	apply_target_filter
	not contains(raw_target_name, ":")
	raw_target_tag != ""
	target_name := sprintf("%s:%s", [raw_target_name, raw_target_tag])
}

format_target_name = target_name {
	apply_target_filter
	not contains(raw_target_name, ":")
	raw_target_tag == ""
	target_name := sprintf("%s:latest", [raw_target_name])
}
