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

default queryResponse = null
default id = null

verify := v {
	v := {
		"allow": Allow,
		"violation": {
			"type": "restricted cmd_line",
			"details": violations,
		},
		"summary": [summary],
		"errors": superset.errors | errors,
	}
} 

# change
id = superset.datasetID("dataset_ProcessesData") {
  valid_config(args.executables)
}

policyQuery := v {
	v := query(id)	
}

queryResponse := v {
  valid_config(args.executables)
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
  not valid_config(args.executables)
  msg := "executables is not valid"
}

Allow {
	queryResponse
	count(violations) <= 0
}

violations = j {
  
  valid_config(args.executables)

  j := [ r |
    modification := queryResponse[0].data[_]
    parsedCmdLine := split(trim(modification.cmd_line, "{}"), ",")
    command := concat(" ", parsedCmdLine)

    r := {
      "timestamp": format_time(modification.created),
      "work_dir": modification.work_dir,
      "executable": modification.executable,
      "cmd_line": command,
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
	v := "No executable found with specified restricted command line input"
}

reason = v {
	not Allow
	count(violations) != 0
	v := sprintf("Executable(s) found with specified restricted command line input: %d", [count(violations)])
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
        "mainAttestation",
        "executable", 
        "cmd_line", 
        "created",
        "work_dir"
      ],
      "filters": filters,
    }
  ]
}

filters = f {   
    f := array.concat(startingFilter, mainAttestationFilter)
}

startingFilter = sF {
  sF := [
    {
      "col": "executable",
      "op": "in",
      "val": args.executables
    }
  ]
}

mainAttestationFilter = mA {

  input.verifier.store == "scribe"
  input.verifier.ref != null

  mA := [
      {
          "col": "mainAttestation",
          "op": "in",
          "val": input.verifier.ref
      }
  ]
}

valid_config(list) {
  list != null
  list != []
}

format_time(unix_timestamp) = rfc3339_time {
  miliseconds := unix_timestamp * 1000
  nanoseconds := miliseconds * 1000
  rfc3339_time := time.format(nanoseconds)
}
