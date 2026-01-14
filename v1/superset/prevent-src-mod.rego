package verify

import data.superset
import future.keywords.every
import future.keywords.in

package_loaded := true

default Allow = false

default violations = []

config = superset.config

args = superset.args

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
			"type": "modified-source-files",
			"details": violations,
		},
		"summary": [summary],
		"errors": errors,
	}
} 

id := superset.datasetID("dataset_Global_Joined_On_Same_Path")

policyQuery := v {
	v := query(id)	
}

queryResponse := v {
  valid_inputs
	v := superset.Query(config, policyQuery)
}

errors[msg] {
  valid_inputs
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
  valid_inputs
	not queryResponse
	actualResponse := superset.QueryPrepare(config, policyQuery)
	msg := sprintf("no result in API response: %s", [actualResponse.body])
}

errors[msg] {
	queryResponse
	not queryResponse[0].colnames
	msg := sprintf("malformed result in API response: %s", [queryResponse[0]])
}

errors[msg] {
  not valid_executable(args.executables)
  msg := "executables cannot be null nor empty"
}

errors[msg] {
  not valid_executable(args.not_executable_2_list)
  msg := "not_executable_2_list cannot be null nor empty"
}

errors[msg] {
  filters == []
  msg := "filters cannot be null nor empty"
}

Allow {
	queryResponse
	count(violations) <= 0
}

violations = j {

  j := [ r |
  
    some modification in queryResponse[0].data

    not allowed_path(modification.path)

    r := {
      "path": modification.path, 
      "e1_event_id": modification.e1_event_id,
      "e2_event_id": modification.e2_event_id,
      "e1_action": modification.e1_action,
      "e2_action": modification.e2_action,
      "e1_process": modification.e1_process,
      "e2_process": modification.e2_process,
      "e1_executable": modification.e1_executable,
      "e2_executable": modification.e2_executable,
      "e1_cmd_line": modification.e1_cmd_line,
      "e2_cmd_line": modification.e2_cmd_line,
      "mainAttestation": modification.mainAttestation,
      # "pipelineRun": modification.pipelineRun,
    }
  ]
}

summary = {
	"allow": Allow,
	"reason": reason,
	"violations": count(violations),
}

reason = v {
	Allow
	v := "No modification of source files were found"
}

reason = v {
	not Allow
	count(violations) != 0
	v := sprintf("Possible modification of source files found: %d", [count(violations)])
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
  "force": true,
  "queries": [
    {
      "columns": [
        "path",
        "e1_event_id",
        "e2_event_id",
        "e1_action",
        "e2_action",
        "e1_process",
        "e2_process",
        "e1_executable",
        "e2_executable",
        "e1_cmd_line",
        "e2_cmd_line",
        "pipelineRun",
        "mainAttestation"
      ],
      "filters": filters,
      "extras": {
        "where": where_filter(args.allowed_executables)
      },
      "metrics": [],
      "row_limit": 0
    }
  ],
	"result_format": "json",
	"result_type": "results"
}

where_filter(arr) = filter_string {
    formatted_elements := [sprintf("'%s'", [x]) | x := arr[_]]
    joined := concat(", ", formatted_elements)

    filter_string := sprintf("(e1_executable IN (%s) AND e2_executable NOT IN (%s)) OR (e1_executable NOT IN (%s) AND e2_executable IN (%s))", [joined, joined, joined, joined])
}

filters = f {   
    mA := array.concat(startingFilter, mainAttestationFilter) # mainAttestation
    pR := array.concat(mA, pipelineRunFilter)                 # pipelineRun
    eCL := array.concat(pR, execCmdLineFilter)                # exec_cmd_line
    oCL := array.concat(eCL, outputCmdLineFilter)             # output_cmd_line
    # pP  := array.concat(oCL, pathFilter)                    # path_prefix // modified to use regex match --> allowed_path(path)
    
    f := oCL
}

startingFilter = f {
  f := [
    {
      "col": "e1_action",
      "op": "==",
      "val": "output"
    },
    {
      "col": "e2_action",
      "op": "==",
      "val": "output"
    }
  ]
}

mainAttestationFilter = mA {

  input.verifier.store == "scribe"
  input.verifier.ref != null

  mA := [
      {
          "col": "mainAttestation",
          "op": "==",
          "val": input.verifier.ref
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


# Implemented the path filter as a regex match using opa
# This `pathFilter` uses supersets query filter to filter out the paths that are not in the accepted path list which is not regex compatible
# pathFilter := pP {

#   args.accepted_path_list != null
#   args.accepted_path_list != []

#   pP := [
#     {
#       "col": "path",
#       "op": "not in",
#       "val": args.accepted_path_list
#     }
#   ]
# }

# This is a path filter that is regex compatible
# Instead of using filters in the query, we will use this function to filter out the paths that are not in the accepted path list
allowed_path(path) {
  args.paths_to_exclude_regex_list != null
  args.paths_to_exclude_regex_list != []

  some pattern in args.paths_to_exclude_regex_list

  regex.match(pattern, path)
}

valid_executable(exec) {
  exec != null
  exec != []
}

# Makes sure the user inputs are valid
valid_inputs {
  valid_executable(args.allowed_executables)
}

