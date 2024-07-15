package verify

import data.superset
import future.keywords.every
import future.keywords.in

package_loaded := true

default Allow = false

default violations = []

config = superset.config

args = superset.args.filters

default filters = []
default mainAttestationFilter = []
default pipelineRunFilter = []
default execCmdLineFilter = []
default outputCmdLineFilter = []
default pathFilter = []

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
  
    modification := queryResponse[0].data[_]

    r := {
      "executable": modification.exec_executable,
      "pipelineRun": modification.pipelineRun,
      "context": modification.context,
      "exec_cmd_line": modification.exec_cmd_line,
      "output_cmd_line": modification.output_cmd_line,
      "mainAttestation": modification.mainAttestation,
      "action": modification.output_action,
      "path": modification.path, 
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
    mA := mainAttestationFilter # mainAttestation
    pR := array.concat(mA, pipelineRunFilter) # pipelineRun
    eCL := array.concat(pR, execCmdLineFilter) # exec_cmd_line
    oCL := array.concat(eCL, outputCmdLineFilter) # output_cmd_line
    pP  := array.concat(oCL, pathFilter) # path_prefix
    
    f := pP
}

mainAttestationFilter = mA {

  args.mainAttestation_list != null
  args.mainAttestation_list != []

  mA := [
      {
          "col": "mainAttestation",
          "op": "in",
          "val": args.mainAttestation_list
      }
  ]
}

pipelineRunFilter = pR {

  args.pipelineRun_list != null
  args.pipelineRun_list != []

  pR := [
      {
          "col": "pipelineRun",
          "op": "in",
          "val": args.pipelineRun_list
      }
  ]  
}

execCmdLineFilter := cL {

  args.accepted_exec_cmd_line_list != null
  args.accepted_exec_cmd_line_list != []

  cL := [
    {
      "col": "exec_cmd_line",
      "op": "not in",
      "val": args.accepted_exec_cmd_line_list
    }
  ]
}

outputCmdLineFilter := cL {

  args.accepted_output_cmd_line_list != null
  args.accepted_output_cmd_line_list != []

  cL := [
    {
      "col": "output_cmd_line",
      "op": "not in",
      "val": args.accepted_output_cmd_line_list
    }
  ]
}

pathFilter := pP {

  args.accepted_path_list != null
  args.accepted_path_list != []

  pP := [
    {
      "col": "path",
      "op": "not in",
      "val": args.accepted_path_list
    }
  ]
}


