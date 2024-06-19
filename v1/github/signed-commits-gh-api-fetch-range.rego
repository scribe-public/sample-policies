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
	url := get_url(input.config.args.since, input.config.args.until)

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

get_url(since, until) = url {

	since != null
	until != null

	url := sprintf("https://api.github.com/repos/%s/%s/commits?since=%s&until=%s",
		[input.config.args.owner, input.config.args.repo, since, until])
}

get_url(since, until) = url {

	since != null
	until == null

	url := sprintf("https://api.github.com/repos/%s/%s/commits?since=%s",
		[input.config.args.owner, input.config.args.repo, since])
}

get_url(since, until) = url {

	since == null
	until != null

	url := sprintf("https://api.github.com/repos/%s/%s/commits?until=%s",
		[input.config.args.owner, input.config.args.repo, until])
}

get_url(since, until) = url {

	since == null
	until == null

	url := sprintf("https://api.github.com/repos/%s/%s/commits",
		[input.config.args.owner, input.config.args.repo])
}

is_valid(commit) {
	commit.verification.verified
}


