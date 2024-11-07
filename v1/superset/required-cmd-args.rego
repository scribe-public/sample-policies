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
default executableFilter = []
default mainAttestationFilter = []

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
id = superset.datasetID("dataset_ProcessesData") {
  valid_config(args.required_args)
}

policyQuery := v {
	v := query(id)	
}

queryResponse := v {
  valid_config(args.required_args)
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
  not valid_config(args.required_args)
  msg := "required_args is not valid"
}

Allow {
	queryResponse
	count(violations) <= 0
}

# violations := [{
#   "query": query(id),
#   "input.verifier": input.verifier
#   }]
violations = j {

  # valid_config(args.required_args)
  
  j := [ r |
  
    some app, app_args in args.required_args
    some modification in queryResponse[0].data

    contains(modification.executable, app)
    # parsedCmdLine := split(trim(modification.cmd_line, "{}"), ",")
    # command := concat(" ", parsedCmdLine)

    some pattern in app_args
    not regex.match(pattern, modification.cmd_line)

    r := {
      "timestamp": format_time(modification.created),
      "work_dir": modification.work_dir,
      "executable": modification.executable,
      "cmd_line": modification.cmd_line,
      "required_app": app,
      "required_pattern": pattern,
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
        "mainAttestation", 
        "executable", 
        "cmd_line", 
        "created",
        "work_dir"
      ],
      "filters": mainAttestationFilter,
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
  list != {}
}

format_time(unix_timestamp) = rfc3339_time {
  miliseconds := unix_timestamp * 1000
  nanoseconds := miliseconds * 1000
  rfc3339_time := time.format(nanoseconds)
}
