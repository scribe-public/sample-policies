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

	url := sprintf("https://gitlab.com/api/v4/projects/%s/repository/commits", [project_id])
	
	response := http.send({
		"method": "GET",
		"url": url,
		"headers": {
			"PRIVATE-TOKEN": private_token
		}
	})
	
	j := get_j(response)
	# j := [{"body": response.body}]
}


is_valid(commit) {
	commit.verification.verified
}

get_j(response) = j {

	response.status_code == 200

	j := {r |

		sha := response.body[0].id
		url := sprintf("https://gitlab.com/api/v4/projects/%s/repository/commits/%s/signature", [project_id, sha])

		response_signature := http.send({
			"method": "GET",
			"url": url,
			"headers": {
				"PRIVATE-TOKEN": private_token
			}
		})

		r := {
			"response_signature": response_signature,
			"sha": sha,
			"url": url,
		}
		# not is_valid(commit)
		
		# r := {
		# 	"since": input.config.args.since,
		# 	"until": input.config.args.until,
		# 	"status_code": response.status_code,
		# 	"author": commit.author,
		# 	"sha": commit.tree.sha,
		# 	"url": commit.url,
		# 	"message": commit.message,
		# 	"verification": commit.verification
		# }
	}
}

# get_j(response) = j {

# 	response.status_code != 200

# 	j := {
# 		"status_code": response.status_code,
# 		"url": url,
# 		"authorization": authorization,
# 		"response":	response.body
# 	}
# }



