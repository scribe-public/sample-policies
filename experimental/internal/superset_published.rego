package superset.published

import data.superset.datasets as datasets

import data.superset
import future.keywords.every
import future.keywords.in

package_loaded := true

default Allow = false

default violations = []

default product_name = ""

default product_version = ""

default image_id = ""

default malformed_response = false

dataset_name := "dataset_API_Images"

config = superset.config

args = superset.args.published

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

image_id = context.imageID {
	context.imageID
	context.imageID != null
	context.imageID != ""
}

adjust_version(version) := adjusted {
	adj := lower(version)
	adjusted := regex.replace(adj, "[^a-zA-Z0-9:.]+", "_")
}

Verify := v {
	v := {
		"allow": Allow,
		"violation": {
			"type": "Not Released",
			"details": violations,
		},
		"summary": [summary],
		"errors": superset.errors | errors,
	}
}

id := superset.datasetID("dataset_API_Images")

policyQuery := v {
	queryRes := query(id)
	appNamedQuery := append_appname_filter(queryRes, product_name)
	appVersionedQuery := append_appversion_filter(appNamedQuery, product_version)
	v := append_image_id_filter(appVersionedQuery, image_id)
}

queryResponse := v {
	v := superset.Query(config, policyQuery)
}

errors[msg] {
	not id
	msg := sprintf("couldn't get datasets for %s", [dataset_name])
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
	malformed_response
	msg := "malformed result in API response"
}

malformed_response := true {
	queryResponse
	count(queryResponse) == 0
}

malformed_response := true {
	queryResponse
	not queryResponse[0].data
}

malformed_response := true {
	queryResponse
	queryResponse[0].data
	count(queryResponse[0].data) == 0
}

# errors[msg] {
# 	queryResponse[0]
# 	queryResponse[0].colnames
# 	count(queryResponse[0].colnames) == 0
# 	msg := sprintf("empty result in API response, %s:%s, %s", [product_name, product_version, policyQuery])
# }

Allow {
	queryResponse
	count(violations) <= 0
}

violations = j {
	j := { r |
		some i
        not queryResponse[0].data[i].version_published
		r = {
            "image_id": queryResponse[0].data[i].image_id,
            "targetName": queryResponse[0].data[i].targetName,
			"logical_app": queryResponse[0].data[i].logical_app,
			"logical_app_version": queryResponse[0].data[i].logical_app_version,
            "version_published": queryResponse[0].data[i].version_published,
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
	v := sprintf("pass published policy, failed: %d, max: 0", [count(violations)])
}

reason = v {
	not Allow
	count(violations) != 0
	v := sprintf("fail published policy, failed: %d, max: 0", [count(violations)])
}

reason = v {
	not Allow
	count(violations) == 0
	v := "published policy failed due to API errors"
}

query(id) := {
	"datasource": {
		"id": id,
		"type": "table",
	},
	"force": true,
	"queries": [{
		"columns": [
            "image_id",
            "targetName",
            "logical_app",
            "logical_app_version",
            "version_published",
		],
        "filters": [],
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

append_image_id_filter(q, componentName) := q2 {
	componentName != ""
	filters := array.concat(q.queries[0].filters, [{"col": "image_id", "op": "==", "val": componentName}])
	q2 := {
		"datasource": q.datasource,
		"force": q.force,
		"queries": [{
			"columns": q.queries[0].columns,
			"filters": filters,
		}],
	}
}

append_image_id_filter(q, componentName) := q2 {
	componentName == ""
	q2 = q
}