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
id := superset.datasetID("dataset_Global_Join_On_Same_Path")

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

  j := [ r |
  
    modification := queryResponse[0].data[_]

    # not allowed_path(modification.path)

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
      "context": modification.context,
      "mainAttestation": modification.mainAttestation,
      "pipelineRun": modification.pipelineRun,
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
        "mainAttestation", 
        # "userId", 
        # "teamId", 
        "context", 
        # "mainAttestation_timestamp", 
        # "e1_time", 
        # "e2_time"
      ],
      "filters": filters,
    }
  ]
}

filters = f {   
    mA := array.concat(startingFilter, mainAttestationFilter) # mainAttestation
    pR := array.concat(mA, pipelineRunFilter)                 # pipelineRun
    eCL := array.concat(pR, execCmdLineFilter)                # exec_cmd_line
    oCL := array.concat(eCL, outputCmdLineFilter)             # output_cmd_line
    # pP  := array.concat(oCL, pathFilter)                    # path_prefix // modified to use regex match --> allowed_path(path)
    
    f := oCL
}

startingFilter = f{
  f := [
    {
      "col": "e1_action",
      "op": "==",
      "val": "exec"
    },
    {
      "col": "e2_action",
      "op": "in",
      "val": ["output", "write", "create"]
    }
  ]
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
allowed_path(path) {
  args.accepted_path_regex_list != null
  args.accepted_path_regex_list != []

  some pattern in args.accepted_path_regex_list

  regex.match(pattern, path)
}
