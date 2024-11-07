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
			"type": "required cmd line regex mismatched",
			"details": violations,
		},
		"summary": [summary],
		"errors": superset.errors | errors,
	}
} 

# change
id = superset.datasetID("dataset_FSTracker_Event_Data")

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

# violations := [{
#   "query": query(id),
#   "input.verifier": input.verifier
#   }]
violations = j {
  
  j := [ r |
  
    some event in queryResponse[0].data
    forbidden_event(event)
    r := {
      "timestamp": format_time(event.event_time),
      "executable": event.executable,
      "cmd_line": event.cmd_line,
      "file_path": event.path,
      "action": event.action,
      "pipelineRun": event.pipelineRun,
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
	v := "No entity found using in-memory files"
}

reason = v {
	not Allow
	count(violations) != 0
	v := sprintf("Some entities found using in-memory files %d", [count(violations)])
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
        "mainAttestation",
        "executable",
        "cmd_line",
        "action",
        "pipelineRun",
        "event_time"
      ],
      "filters": filters,
    }
  ]
}

filters = f {   
    f := array.concat(startingFilter, mainAttestationFilter)
}

startingFilter = f {
  f := [
    {
      "col": "action",
      "op": "in",
      "val": array.concat(args.forbidden_actions, ["exec", "input"])
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

format_time(unix_timestamp) = rfc3339_time {
  miliseconds := unix_timestamp * 1000
  nanoseconds := miliseconds * 1000
  rfc3339_time := time.format(nanoseconds)
}

arr_contains(arr, value) {
    arr[_] == value
}

forbidden_event(event) {
    arr_contains(args.forbidden_actions, event.action)
}

forbidden_event(event) {
    not arr_contains(args.forbidden_actions, event.action)
    some pattern in args.forbidden_paths
    startswith(pattern, event.path)
}
