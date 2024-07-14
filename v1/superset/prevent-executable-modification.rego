package verify

import data.superset
import future.keywords.every
import future.keywords.in

package_loaded := true

default Allow = false

default violations = []

config = superset.config

args = superset.args.cve

default filters = []
default append_mainAttestation = []
default append_pipelineRun = []



verify := v {
	v := {
		"allow": Allow,
		"violation": {
			"type": "CVE",
			"details": violations,
		},
		"summary": [summary],
		"errors": superset.errors | errors,
	}
}

# change
id := superset.datasetID("dataset_Modified_Executable")

policyQuery := v {
	v := query(id)	
}

queryResponse := v {
	v := superset.Query(config, policyQuery)
}

errors[msg] {
	not superset.login(config, args)
	msg := "login failed"
}

errors[msg] {
	not id
    msg := "couldn't get dataset id"
}

errors[msg] {
	id
	not policyQuery
	msg := "couldn't create a query dataset"
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

Allow {
	queryResponse
	count(violations) <= 0
}

violations = j {
	j := { r |
		r := {
			"qr": queryResponse,
			"config":config,
			"policyQuery":policyQuery,
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
	v := "No modification of execuatables were found"
}

reason = v {
	not Allow
	count(violations) != 0
	v := sprintf("Possible modification of executables found: %d", [count(violations)])
}

reason = v {
	not Allow
	count(violations) == 0
	v := "policy failed due to API errors"
}

query(id) := {
  "datasource": {
    "id": id,
    "type": "table"
  },
  "force": false,
  "queries": [
    {
      "columns": [
        "path",
        "exec_executable",
        "exec_event_id",
        "output_event_id",
        "exec_action",
        "output_action",
        "exec_cmd_line",
        "output_cmd_line",
        "userId",
        "context",
        "pipelineRun",
        "mainAttestation",
        "exec_time",
        "output_time",
        "timestamp",
        "teamId"
      ],
      "filters": filters,
    }
  ]
}


filters = f {
    v := append_mainAttestation
    f := array.concat(v, [append_pipelineRun])
}

append_mainAttestation = f {

    args.mainAttestation != null
    args.mainAttestation != []

    f := [
        {
            "col": "mainAttestation",
            "op": "in",
            "val": args.mainAttestation
        }
    ]
}

append_pipelineRun = f {

    args.pipelineRun != null
    args.pipelineRun != []

    f := [
        {
            "col": "pipelineRun",
            "op": "in",
            "val": args.pipelineRun
        }
    ]
}



