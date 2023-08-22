package verify

default allow = false
default branch = "wtfbr"
default msg := "Found commits to main branch"

verify = v {
        v := {
        "allow": allow,
            "summary": [{
            "allow": allow,
            "reason":  msg,
        }]
    }
}

branch = input.evidence.predicate.environment.git_branch

allow {
    branch != "main"
    branch != "master"
}

msg = "No commits to main branch found" { allow }