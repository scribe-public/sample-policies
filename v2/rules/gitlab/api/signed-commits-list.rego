package verify

import future.keywords.in

default allow := false
default violations := []
default commit_id_list := []

commit_id_list := input.config.args.commit_id_list {
	input.config.args.commit_id_list
}

default private_token := ""

private_token := input.config.args.private_token {
	input.config.args.private_token != null
}

default project_id := ""

project_id := input.config.args.project_id {
	input.config.args.project_id != null
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


errors[msg] {
	private_token == "" 
	msg := "private_token is required"
}

errors[msg] {
	count(commit_id_list) == 0
	msg := "commit_id_list cannot be empty"
}


violations = j {
	count(errors) == 0

	j := {r |
		commit_id := commit_id_list[_]

		# url := sprintf("https://gitlab.com/api/v4/projects/%s/repository/commits/%s/signature", [project_id, commit_id])
		url := sprintf("https://gitlab.com/api/v4/projects/%s/repository/commits/%s/signature", [project_id, commit_id])
	
		response := http.send({
			"method": "GET",
			"url": url,
			"headers": {
				"PRIVATE-TOKEN": private_token
			}
		})

		r := get_r(response, commit_id, url)
	}
}

get_r(response, commit_id, url) = r {
	
	response.status_code == 404
	response.body.message == "404 Signature Not Found"
	
	r := {
		"commit_id": commit_id,
		"status_code": response.status_code,
		"url": url,
		"response":	response.body,
		"signed": false,
	}	
}

get_r(response, commit_id, url) = r {
	
	response.status_code == 404
	response.body.message != "404 Signature Not Found"
	r := {
		"commit_id": commit_id,
		"status_code": response.status_code,
		"url": url,
		"response":	response.body,
	}	
}
