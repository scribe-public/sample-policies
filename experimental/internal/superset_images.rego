package superset.images

import data.superset
import future.keywords.every
import future.keywords.in

package_loaded := true

default Allow = false

default max = 0

default violations = []

config = superset.config

args = superset.args.images

max = args.max

context = superset.context

errors = superset.errors

Verify := v {
	v := {
		"allow": Allow,
		"violation": {
			"type": "Images",
			"details": violations,
		},
		"summary": [summary],
		"errors": errors,
	}
}

policyQuery := v {
	id := superset.datasetID("dataset_API_Attestations")
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
		r = {"attestation_timestamp": policyQuery[0].data[i].attestation_timestamp}
	}
}

summary = {
	"allow": Allow,
	"reason": reason,
	"violations": count(violations),
}

reason = v {
	Allow
	v := sprintf("pass images policy, found images: %d, max allowed: %d", [count(violations), max])
}

reason = v {
	not Allow
	count(violations) != 0
	v := sprintf("fail images policy, found images: %d, max allowed: %d", [count(violations), max])
}

reason = v {
	not Allow
	count(violations) == 0
	v := "fail images policy, no violations found"
}

query(appName, appVersion, id) := {
	"datasource": {
		"id": id,
		"type": "table",
	},
	"force": true,
	"queries": [{
		"columns": [
			"attestation_timestamp",
			"logical_app",
			"logical_app_version",
			"targetName",
			{
				"label": "tag",
				"sqlExpression": "context->>'input_tag'",
				"expressionType": "SQL",
			},
		],
		"filters": [
			{
				"col": "targetType",
				"op": "==",
				"val": "image",
			},
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
		"metrics": [],
		"row_limit": 0,
	}],
}
