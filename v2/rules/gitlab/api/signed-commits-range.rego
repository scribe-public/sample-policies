package verify

import future.keywords.in

default allow := false
default violations := []
default private_token := ""

private_token := input.config.args.private_token {
	input.config.args.private_token != null
}

default project_id := ""

project_id := input.config.args.project_id {
	input.config.args.project_id != null
}

errors[msg] {
	private_token == "" 
	msg := "private_token is required"
}

errors[msg] {
	project_id == ""
	msg := "project_id is required"
}

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "Unsigned commit",
			"details": violations,
		},
		"summary": [{
			"allow": allow,
			"reason": reason,
			"violations": count(violations),
		}],
		"errors": errors,
	}
}

allow {
	count(violations) == 0
}

reason = v {
	allow
	v := "All the commits are signed"
}



reason = v {
	not allow
	v := "There is at least one unsigned commit/Cannot fetch commit details"
}

violations = j {
	count(errors) == 0

	url := get_url(input.config.args.since, input.config.args.until)
	
	response := http.send({
		"method": "GET",
		"url": url,
		"headers": {
			"PRIVATE-TOKEN": private_token
		}
	})
	
	j := [{"r":get_j(response, url)}]
}

get_j(response, url) = j {

	response.status_code == 200

	j := {r |

		commit := response.body[_]
		sha := commit.id
		url_signature := sprintf("https://gitlab.com/api/v4/projects/%s/repository/commits/%s/signature", [project_id, sha])

		response_signature := http.send({
			"method": "GET",
			"url": url_signature,
			"headers": {
				"PRIVATE-TOKEN": private_token
			}
		})
		
		r := get_r(response_signature, sha, url_signature, commit.created_at, commit.author_name)
	}
}

get_j(response, url) = j {

	response.status_code != 200

	j := {
		"status_code": response.status_code,
		"url": url,
		"authorization": private_token,
		"response":	response.body,
	}
}

get_r(response, commit_id, url, created_at, author_name) = r {
	
	response.status_code == 404
	response.body.message == "404 Signature Not Found"
	
	r := {
		"commit_id": commit_id,
		"status_code": response.status_code,
		"url": url,
		"response":	response.body,
		"signed": false,
		"created_at": created_at,
		"author_name": author_name,
	}	
}

get_r(response, commit_id, url, created_at, author_name) = r {
	
	response.status_code == 404
	response.body.message != "404 Signature Not Found"
	r := {
		"commit_id": commit_id,
		"status_code": response.status_code,
		"url": url,
		"response":	response.body,
		"created_at": created_at,
		"author_name": author_name,
	}	
}

get_url(since, until) = url {

	since != null
	until != null

	url := sprintf("https://gitlab.com/api/v4/projects/%s/repository/commits?since=%s&until=%s", [project_id, since, until])
}

get_url(since, until) = url {

	since == null
	until != null

	url := sprintf("https://gitlab.com/api/v4/projects/%s/repository/commits?until=%s", [project_id, until])
}

get_url(since, until) = url {

	since != null
	until == null

	url := sprintf("https://gitlab.com/api/v4/projects/%s/repository/commits?since=%s", [project_id, since])
}

get_url(since, until) = url {

	since == null
	until == null

	url := sprintf("https://gitlab.com/api/v4/projects/%s/repository/commits", [project_id])
}
