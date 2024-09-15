package superset.datasets

import data.auth.superset as auth_superset
import data.superset
import future.keywords.in

query(url, token) := v {
	v := {
		"url": sprintf("%s/dataset", [url]),
		"method": "POST",
		"headers": {
			"Authorization": concat("", ["Bearer ", token.token]),
			"Content-Type": "application/json",
		},
		"body": {"superset_token": sprintf("%s", [token.stoken])},
	}
}

parseDatasets(body) = v {
	v := {x |
		some dataset in body
		name := concat("_", ["dataset", replace(dataset.datasource_name, " ", "_")])
		x := {
			"name": name,
			"id": dataset.id,
		}
	}
}

sendQuery(url, token) = v {
	r := http.send(query(url, token))
	v := r.body.result
}

getDatasets(url, token) = v {
	r := sendQuery(url, token)
	v := parseDatasets(r)
}
