package internal.superset.licences

import data.internal.superset
import future.keywords.every
import future.keywords.in

package_loaded := true

default Allow = false

default max = 0

default violations = []

config = superset.config

args = superset.args.licences

max = args.max

context = superset.context

errors = superset.errors

Verify := v {
	v := {
		"allow": Allow,
		"violation": {
			"type": "Licenses",
			"details": violations,
		},
		"summary": [summary],
		"errors": errors,
	}
}

policyQuery := v {
	id = superset.datasetID("dataset_asbom_filtered")
	queryRes := query(context.name, context.product_version, id)
	v := superset.Query(config, queryRes)
}

Allow {
	policyQuery
	count(violations) <= max
}

violations := v {
	v := {r |
		some i
		r = {"license": policyQuery[0].data[i].License}
	}
}

summary = {
	"allow": Allow,
	"reason": reason,
	"violations": count(violations),
}

reason = v {
	Allow
	v := sprintf("pass license policy, found licenses: %d, max allowed: %d", [count(violations), max])
}

reason = v {
	not Allow
	count(violations) != 0
	v := sprintf("fail license policy, found licenses: %d, max allowed: %d", [count(violations), max])
}

reason = v {
	not Allow
	count(violations) == 0
	v := "fail license policy, no violations found"
}

query(appName, appVersion, id) = {
	"datasource": {
		"id": id,
		"type": "table",
	},
	"force": true,
	"queries": [{
		"filters": [
			{
				"col": "logical_app",
				"op": "==",
				"val": appName,
			},
			{
				"col": "logical_app_version",
				"op": "==",
				"val": appVersion,
			},
		],
		"columns": [],
		"metrics": [{
			"expressionType": "SQL",
			"sqlExpression": "distinct unnest(string_to_array(licenses, ','))",
			"label": "License",
		}],
		"orderby": [[
			{
				"expressionType": "SQL",
				"sqlExpression": "distinct unnest(string_to_array(licenses, ','))",
			},
			true,
		]],
		"row_limit": 0,
	}],
}
