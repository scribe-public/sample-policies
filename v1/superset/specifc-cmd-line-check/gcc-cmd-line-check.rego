package verify

import data.superset
import future.keywords.every
import future.keywords.in

package_loaded := true

default Allow := false

default violations := []

config := superset.config

args := superset.args.filters

default filters := []

default startingFilter := []

default mainAttestationFilter := []

default pipelineRunFilter := []

default executableFilter := []

default queryResponse := null

default id := null

verify := v {
	v := {
		"allow": Allow,
		"violation": {
			"type": "unsecure gcc command line",
			"details": violations,
		},
		"summary": [summary],
		"errors": superset.errors | errors,
	}
}

# change
id = superset.datasetID("dataset_Global_Joined_On_Same_Path")

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
	
  j := [r |
		
    modification := queryResponse[0].data[_]
		
    # Fails if cmdline doesn't contain any secure flags
		does_not_include_any_secure_flags(modification.e1_cmd_line)

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
	v := "All gcc command lines were found with secure flags"
}

reason = v {
	not Allow
	count(violations) != 0
	v := sprintf("gcc command line(s) found with non secure flags: %d", [count(violations)])
}

reason = v {
	not Allow
	count(violations) == 0
	v := "policy failed due to API errors"
}

query(id) := {
	"datasource": {
		"id": id,
		"type": "table",
	},
	"force": false,
	"queries": [{
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
			"where": "(e1_action = 'exec' AND e1_event_id = e2_event_id AND e1_cmd_line Like '%gcc%')", # Added like for gcc
			"time_grain_sqla": "P1D",
		},
		"row_limit": 100,
	}],
}

filters = f {
	mA := array.concat(startingFilter, mainAttestationFilter) # mainAttestation
	pR := array.concat(mA, pipelineRunFilter) # pipelineRun
	e := array.concat(pR, executableFilter) # e1_executable

	f := e
}

startingFilter = sF {
	sF := []
}

mainAttestationFilter = mA {
	args.mainAttestation_list != null
	args.mainAttestation_list != []

	mA := [{
		"col": "mainAttestation",
		"op": "in",
		"val": args.mainAttestation_list,
	}]
}

pipelineRunFilter = pR {
	args.pipelineRun_list != null
	args.pipelineRun_list != []

	pR := [{
		"col": "pipelineRun",
		"op": "in",
		"val": array.concat(args.pipelineRun_list, [input.config.args.pipelineRunId]),
	}]
}

pipelineRunFilter = pr {

  not not_empty_nor_null_list(args.pipelineRun_list)
  input.config.args.pipelineRunId != null

  pr := [{
    "col": "pipelineRun",
    "op": "==",
    "val": input.config.args.pipelineRunId,
  }]
}

executableFilter = e {
	args.executable_to_check_list != null
	args.executable_to_check_list != []

	e := [{
		"col": "e1_executable",
		"op": "in",
		"val": args.executable_to_check_list,
	}]
}

# Define the secure flags to check
secure_flags := {
	"-fstack-protector-strong",
	"-fstack-protector-all",
	"-fPIE",
	"-pie",
	"-Wl,-z,relro",
	"-Wl,-z,now",
	"-D_FORTIFY_SOURCE=2",
	"-Wformat",
	"-Wformat-security",
	"-fcf-protection",
}

# Function to check if the provided command line contains any secure flags
contains_any_secure_flag(cmdline) {
  some flag in secure_flags
  contains(cmdline, flag)
}

# Function to check if the command line is missing all secure flags
does_not_include_any_secure_flags(cmdline) {
	not contains_any_secure_flag(cmdline) # If none of the secure flags are present
}

not_empty_nor_null_list(lst){
  lst != null
  lst != []
}
