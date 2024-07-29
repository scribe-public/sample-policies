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
default startingFilter = []
default mainAttestationFilter = []
default pipelineRunFilter = []
default commandLineFilter = []


verify := v {
	v := {
		"allow": Allow,
		"violation": {
			"type": "cmdLine matched",
			"details": violations,
		},
		"summary": [summary],
		"errors": superset.errors | errors,
	}
} 

# change
id := superset.datasetID("dataset_Global_Joined_On_Same_Path")

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

errors[msg] {
  not valid_command_line_list(args.command_line_list)

  msg := "invalid command line list"
}

Allow {
	queryResponse
	count(violations) <= 0
}

violations = j {
  
  valid_command_line_list(args.command_line_list)

  j := [ r |
  
    modification := queryResponse[0].data[_]

    not allowed_path(modification.path)

    r := {
      "path": modification.path, 
      "e1_event_id": modification.e1_event_id,
      "e1_action": modification.e1_action,
      "e1_process": modification.e1_process,
      "e1_executable": modification.e1_executable,
      "e1_cmd_line": modification.e1_cmd_line,
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
	v := "No files found with specific command line input"
}

reason = v {
	not Allow
	count(violations) != 0
	v := sprintf("Files found with specific command line input: %d", [count(violations)])
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
        "e1_action", 
        "e1_process", 
        "e1_executable", 
        "e1_cmd_line", 
        "pipelineRun",
        "mainAttestation", 
        # "userId", 
        # "teamId", 
        "context", 
        # "mainAttestation_timestamp", 
        # "e1_time", 
      ],
      "filters": filters,
      "extras": {
        "having": "",
        "where": "(e1_action = 'input' AND e1_event_id = e2_event_id)",
        "time_grain_sqla": "P1D"
      },
      "row_limit": 10
    }
  ]
}

filters = f {   
    mA := array.concat(startingFilter, mainAttestationFilter) # mainAttestation
    pR := array.concat(mA, pipelineRunFilter)                 # pipelineRun
    cL := array.concat(pR, commandLineFilter)                 # cmdLine

    f := cL
}

startingFilter = sF {
  sF := []
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

commandLineFilter = cL {
  
  args.command_line_list != null
  args.command_line_list != []

  cL := [
      {
          "col": "e1_cmd_line",
          "op": "in",
          "val": args.command_line_list
      }
  ]
}

# This is a path filter that is regex compatible
allowed_path(path) {
  args.accepted_path_regex_list != null
  args.accepted_path_regex_list != []

  some pattern in args.accepted_path_regex_list

  regex.match(pattern, path)
}

valid_command_line_list(list) {
  list != null
  list != []
}
