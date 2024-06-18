package verify

import future.keywords.in

default allow := false

default violations := []

default commit_id_list := []

commit_id_list := input.config.args.commit_id_list {
	input.config.args.commit_id_list
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
	not input.config.args.access_token
	msg := "access_token is required"
}

errors[msg] {
	not input.config.args.owner
	msg := "owner is required"
}

errors[msg] {
	not input.config.args.repo
	msg := "repo is required"
}

errors[msg] {
	count(commit_id_list) == 0
	msg := "commit_id_list cannot be empty"
}


violations = j {
	count(errors) == 0
	j := {r |
		commit_id := commit_id_list[_]

		url := sprintf("https://api.github.com/repos/%s/%s/commits/%s",
               [input.config.args.owner, input.config.args.repo, commit_id])

		authorization = sprintf("Bearer %s", [input.config.args.access_token])
		
		response := http.send({
			"method": "GET",
			"url": url,
			"headers": {
				"Accept": "application/vnd.github+json",
				"Authorization": authorization,
				"X-GitHub-Api-Version": "2022-11-28"
			}
    	})

		commit_details := get_commit_details(response, commit_id, url, authorization)
		
		not is_valid(commit_details)

		r := commit_details
	}
}

get_commit_details(response, commit_id, url, authorization) = r {
	response.status_code == 200
	r := {	
		"commit_id": commit_id,
		"status_code": response.status_code,
		"url": url,
		"authorization": authorization,
		"commit": {
			"verification": {
				"verified": response.body.commit.verification.verified
			}
		}
	}
} 

get_commit_details(response, commit_id, url, authorization) = r {
	response.status_code != 200
	r := {
	"commit_id": commit_id,
	"status_code": response.status_code,
	"url": url,
	"authorization": authorization,
	"response":	response.body
	}	
}

is_valid(commit_details) {
	commit_details.commit.verification.verified
}





