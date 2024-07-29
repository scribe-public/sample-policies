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
default executableFilter = []

default queryResponse = null
default id = null


verify := v {
	v := {
		"allow": Allow,
		"violation": {
			"type": "required cmd line regex mismatched",
			"details": violations,
		},
		"summary": [summary],
		"errors": superset.errors | errors,
	}
} 

# change
id = superset.datasetID("dataset_Global_Joined_On_Same_Path") {
  valid_config(args.required_cmdLine_regex_list)
}

policyQuery := v {
	v := query(id)	
}

queryResponse := v {
  valid_config(args.required_cmdLine_regex_list)
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
  not valid_config(args.required_cmdLine_regex_list)
  msg := "required_cmdLine_regex_list is not valid"
}

Allow {
	queryResponse
	count(violations) <= 0
}

violations = j {

  valid_config(args.required_cmdLine_regex_list)
  
  j := [ r |
  
    modification := queryResponse[0].data[_]

    not required_cmdLine(modification.e1_cmd_line)

    r := {
      "path": modification.path, 
      "e1_event_id": modification.e1_event_id,
      "e1_action": modification.e1_action,
      "e1_process": modification.e1_process,
      "e1_executable": modification.e1_executable,
      "e1_cmd_line": modification.e1_cmd_line,
      # "context": modification.context,
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
	v := "No executable found without specified required command line input"
}

reason = v {
	not Allow
	count(violations) != 0
	v := sprintf("Executable(s) found without specified required command line input: %d", [count(violations)])
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
        "where": "(e1_action = 'exec' AND e1_event_id = e2_event_id)",
        "time_grain_sqla": "P1D"
      },
      # "row_limit": 10
    }
  ]
}

filters = f {   
    mA := array.concat(startingFilter, mainAttestationFilter) # mainAttestation
    pR := array.concat(mA, pipelineRunFilter)                 # pipelineRun
    e := array.concat(pR, executableFilter)                   # e1_executable

    f := e
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

executableFilter = e {

  args.executable_to_check_list != null
  args.executable_to_check_list != []

  e := [
      {
          "col": "e1_executable",
          "op": "in",
          "val": args.executable_to_check_list
      }
  ]
}

# Regex matching for required_cmdLine_regex_list
required_cmdLine(cmdLine) {
  args.required_cmdLine_regex_list != null
  args.required_cmdLine_regex_list != []

  every pattern in args.required_cmdLine_regex_list {
    regex.match(pattern, cmdLine)
  }
}


valid_config(list) {
  list != null
  list != []
}

