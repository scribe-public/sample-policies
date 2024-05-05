package verify

import data.superset
import future.keywords.every
import future.keywords.in

package_loaded := true

default Allow = false

default violations = []

default max = 0

default severity = 6

default product_name = ""

default product_version = ""

default component_name = ""

default component_version = ""

config = superset.config

args = superset.args.cve

max = args.max

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

superset_errors = superset.errors

verify := v {
	v := {
		"allow": Allow,
		"violation": {
			"type": "CVE",
			"details": violations,
		},
		"summary": [summary],
		"errors": errors,
	}
}

policyQuery := v {
	id := superset.datasetID("dataset_API_Vulnerabilities")
	queryRes := query(id)
	appNamedQuery := append_appname_filter(queryRes, product_name)
	appVersionedQuery := append_appversion_filter(appNamedQuery, product_version)
	componentNamedQuery := append_component_name_filter(appVersionedQuery, component_name)
	v := append_component_version_filter(componentNamedQuery, component_version)
}

queryResponse := v {
	v := superset.Query(config, policyQuery)
}

errors[msg] {
	superset_errors["login failed"]
	msg := superset_errors["login failed"]
}

errors[msg] {
	superset_errors["service url not found"]
	msg := superset_errors["service url not found"]
}

errors[msg] {
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

Allow {
	queryResponse
	count(violations) <= max
}

violations = j {
	j := { r |
		some i
		r = {
			"id": queryResponse[0].data[i].vulnerability_id,
			"severity": queryResponse[0].data[i].severity,
			"final_severity": queryResponse[0].data[i].final_severity,
			"advisoryText": queryResponse[0].data[i].advisoryText,
			"advisoryStatus": queryResponse[0].data[i].advisoryStatus,
			"advisoryJustification": queryResponse[0].data[i].advisoryJustification,
			"component_name": queryResponse[0].data[i].component_name,
			"component_version": queryResponse[0].data[i].component_version,
			}
	}
}

summary = {
	"allow": Allow,
	"reason": reason,
	"violations": count(violations),
}

reason = v {
	Allow
	v := sprintf("pass cve policy, failed: %d, max: %d", [count(violations), max])
}

reason = v {
	not Allow
	count(violations) != 0
	v := sprintf("fail cve policy, failed: %d, max: %d", [count(violations), max])
}

reason = v {
	not Allow
	count(violations) == 0
	v := "cve policy failed due to API errors"
}

query(id) := {
	"datasource": {
		"id": id,
		"type": "table",
	},
	"force": false,
	"queries": [{
		"columns": [
			"vulnerability_id",
			"severity",
			"final_severity",
			"advisoryText",
			"advisoryStatus",
			"advisoryJustification",
			"component_name",
			"component_version",
		],
		"filters": [
			{
				"col": "final_severity",
				"op": ">=",
				"val": severity,
			},
		],
	}],
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
		}],
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
		}],
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
		}],
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
		}],
	}
}

append_component_version_filter(q, componentVersion) := q2 {
	componentVersion == ""
	q2 = q
}