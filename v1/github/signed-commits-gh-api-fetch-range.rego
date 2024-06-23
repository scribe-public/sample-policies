package verify

import future.keywords.in

default allow := false

default violations := []

default owner := ""

owner := input.config.args.owner {
	input.config.args.owner != null
}

default repo := ""

repo := input.config.args.repo {
	input.config.args.repo != null
}

default access_token := ""

access_token := input.config.args.access_token {
	input.config.args.access_token != null
}

errors[msg] {
	access_token == "" 
	msg := "access_token is required"
}

errors[msg] {
	owner == ""
	msg := "owner is required"
}

errors[msg] {
	repo == ""
	msg := "repo is required"
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
	url := get_url(input.config.args.since, input.config.args.until, input.config.args.sha)

	authorization = sprintf("Bearer %s", [access_token])
	
	response := http.send({
		"method": "GET",
		"url": url,
		"headers": {
			"Accept": "application/vnd.github+json",
			"Authorization": authorization,
			"X-GitHub-Api-Version": "2022-11-28"
		}
	})
	j := get_j(response, url, authorization)
}

get_url(since, until, sha) = url {

	since != null
	until != null
	sha != null

	url := sprintf("https://api.github.com/repos/%s/%s/commits?since=%s&until=%s&sha=%s",
		[owner, repo, since, until, sha])
}

get_url(since, until, sha) = url {

	since != null
	until == null
	sha != null

	url := sprintf("https://api.github.com/repos/%s/%s/commits?since=%s&sha=%s",
		[owner, repo, since,sha])
}

get_url(since, until, sha) = url {

	since == null
	until != null
	sha != null

	url := sprintf("https://api.github.com/repos/%s/%s/commits?until=%s&sha=%s",
		[owner, repo, until, sha])
}

get_url(since, until, sha) = url {

	since == null
	until == null
	sha != null

	url := sprintf("https://api.github.com/repos/%s/%s/commits?sha=%s",
		[owner, repo, sha])
}

get_url(since, until, sha) = url {

	since != null
	until != null
	sha == null

	url := sprintf("https://api.github.com/repos/%s/%s/commits?since=%s&until=%s",
		[owner, repo, since, until])
}

get_url(since, until, sha) = url {

	since != null
	until == null
	sha == null

	url := sprintf("https://api.github.com/repos/%s/%s/commits?since=%s",
		[owner, repo, since])
}

get_url(since, until, sha) = url {

	since == null
	until != null
	sha == null

	url := sprintf("https://api.github.com/repos/%s/%s/commits?until=%s",
		[owner, repo, until])
}

get_url(since, until, sha) = url {

	since == null
	until == null
	sha == null

	url := sprintf("https://api.github.com/repos/%s/%s/commits",
		[owner, repo])
}

is_valid(commit) {
	commit.verification.verified
}

get_j(response,  url, authorization) = j {

	response.status_code == 200

	j := {r |

		commit := response.body[_].commit

		not is_valid(commit)
		
		r := {
			"since": input.config.args.since,
			"until": input.config.args.until,
			"status_code": response.status_code,
			"author": commit.author,
			"sha": commit.tree.sha,
			"url": commit.url,
			"message": commit.message,
			"verification": commit.verification
		}
	}
}

get_j(response, url, authorization) = j {

	response.status_code != 200

	j := {
		"status_code": response.status_code,
		"url": url,
		"authorization": authorization,
		"response":	response.body
	}
}



