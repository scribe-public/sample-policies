package superset

import data.auth.evidence as auth_evidence
import data.auth.superset as auth_superset
import data.cve
import data.licences
import data.superset.datasets as datasets
import data.unmaintained

import future.keywords.every
import future.keywords.in

package_loaded := true

default Unmaintained = []

default loginDirect = false

evidence = v {
	v := input.evidence
}

verifier = v {
	v := input.verifier
}

config = v {
	v := input.config.stores.scribe
}

args = v {
	v := input.config.args.superset
}

context = v {
	v := input.verifier
}

serviceURL(config) = v {
	v = config.service.url
}

serviceDataEndpoint(args) = v {
	v := "/dataset/data"
}

datasetID(name) := v {
	token := login(config, args)
	parsed_datasets := datasets.getDatasets(serviceURL(config), token)
	some dataset
	parsed_datasets[dataset].name == name
	v := dataset.id
}

get(url, token) = response {
	request := {
		"method": "GET",
		"url": url,
		"headers": {
			"Authorization": concat("", ["Bearer ", token.token]),
			"Accept": "application/json",
		},
		"timeout": "30m",
		"raise_error": false,
		"force_json_decode": true,
		"max_retry_attempts": 5,
	}

	response := http.send(request)
}

getDebug(url, token) = v {
	request := {
		"method": "GET",
		"url": url,
		"headers": {
			"Authorization": concat("", ["Bearer ", token.token]),
			"Accept": "application/json",
		},
		"timeout": "100s",
		"raise_error": false,
		"force_json_decode": true,
		"max_retry_attempts": 5,
	}
	v := {
		"request": request,
		"response:": http.send(request),
	}
}

preparePost(url, upload_data, token) = {
	"method": "POST",
	"url": sprintf("%s", [url]),
	"headers": {
		"Authorization": concat("", ["Bearer ", token.token]),
		"Content-Type": "application/json",
	},
	"body": {
		"superset_token": sprintf("%s", [token.stoken]),
		"validate": false,
		"result_format": "json",
		"result_type": "results",
		"query": upload_data,
	},
	"timeout": "30m",
	"max_retry_attempts": 5,
}

post(url, upload_data, token) = response {
	request := {
		"method": "POST",
		"url": url,
		"headers": {
			"Authorization": concat("", ["Bearer ", token.token]),
			"Content-Type": "application/json",
		},
		"body": {
			"superset_token": sprintf("%s", [token.stoken]),
			"validate": false,
			"result_format": "json",
			"result_type": "results",
			"query": upload_data,
		},
		"timeout": "30m",
		"max_retry_attempts": 5,
	}
	response := http.send(request)
}

postDebug(url, upload_data, token) = v {
	request := {
		"method": "POST",
		"url": url,
		"headers": {
			"Authorization": concat("", ["Bearer ", token.token]),
			"Accept": "application/vnd.github.v3+json",
			"Content-Type": "application/json",
		},
		"raise_error": false,
		"body": {
			"superset_token": sprintf("%s", [token.stoken]),
			"validate": false,
			"result_format": "json",
			"result_type": "results",
			"query": upload_data,
		},
		"timeout": "30m",
		"max_retry_attempts": 5,
	}

	v := {
		"request": request,
		"response:": http.send(request),
	}
}

login(config, args) = v {
	token = auth_evidence.getToken(serviceURL(config), config.auth)
	v := {
		"token": token,
		"stoken": auth_superset.getToken(serviceURL(config), config.auth, args, token),
	}
}

errors[msg] {
	not login(config, args)
	msg := "login failed"
}

# errors[msg] {
# 	not context.name
# 	msg = "app name missing"
# }

# errors[msg] {
# 	not context.product_version
# 	msg = "app version missing"
# }

errors[msg] {
	not serviceURL(config)
	msg = "service url not found"
}

# ListDataSet(config) = v {
#   url := concat("",[serviceURL(config), "/dataset"])
#   r := get(url, login(config))
#   v := r.body["result"]
# }

# List(config) = v {
#   v := ListDataSet(config)
# }

# List(config) = v {
#   not ListDataSet(config)
#   v = []
# }

QueryPrepare(config, obj) = r {
	url := concat("", [serviceURL(config), serviceDataEndpoint(args)])
	r := post(url, obj, login(config, args))
}

Query(config, obj) := v {
	url := concat("", [serviceURL(config), serviceDataEndpoint(args)])
	r := post(url, obj, login(config, args))
	v := r.body.result
}

QueryDebug(config, obj) := v {
	url := concat("", [serviceURL(config), serviceDataEndpoint(args)])
	v := postDebug(url, obj, login(config, args))
}
