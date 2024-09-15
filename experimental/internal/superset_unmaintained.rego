package superset.unmaintained

import data.superset
import future.keywords.every
import future.keywords.in

package_loaded := true

default Allow = false

default violations = []

default max = 0

config = superset.config

env = config.env

args = superset.args.unmaintained

max = args.max

context = superset.context

errors = superset.errors

Verify := v {
	v := {
		"allow": Allow,
		"violation": {
			"type": "Unmainained",
			"details": violations,
		},
		"summary": [summary],
		"errors": errors,
	}
}

policyQuery := v {
	id := superset.datasetID("dataset_asbom_filtered")
	queryRes := query(context.name, context.product_version, id)
	v := superset.Query(config, queryRes)
}

Allow {
	policyQuery
	count(violations) <= max
}

violations = j {
	j := {r |
		some i
		r = {
			"component_name": policyQuery[0].data[i].component_name,
			"maintenance_score": policyQuery[0].data[i].maintenance_score,
			"scorecard_score": policyQuery[0].data[i].scorecard_score,
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
	v := sprintf("pass unmantained policy, failed: %d, max: %d", [count(violations), max])
}

reason = v {
	not Allow
	count(violations) != 0
	v := sprintf("fail unmantained policy, failed: %d, max: %d", [count(violations), max])
}

reason = v {
	not Allow
	count(violations) == 0
	v := "fail unmantained policy, no violations found"
}

query(appName, appVersion, id) := {
	"datasource": {
		"id": id,
		"type": "table",
	},
	"force": true,
	"queries": [{
		"columns": [
			"component_name",
			"scorecard_score",
			"source_layer",
			"maintenance_score",
		],
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
			{
				"col": "scorecard_score",
				"op": "IS NOT NULL",
			},
			{
				"col": "scorecard_score",
				"op": "<",
				"val": "3",
			},
		],
		"metrics": [],
		"row_limit": 0,
	}],
}
