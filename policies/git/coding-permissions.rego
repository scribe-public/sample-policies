package verify
import future.keywords.in

default allow := false
default violations := []
default props := []
default author := ""

config := {
    "ids": ["@golang.com", "@golang.org"],
    "files": ["build.go", "internal/https/README.md"],
}

verify = v {
        v := {
        "allow": allow,
        "violations": violations,
            "summary": [{
            "allow": allow,
            "reason":  "Some files are commited by unauthorized authors",
            "violations": count(violations),
        }]
    }
}

allow {
    count(violations) == 0
}

violations = j {
j := { r |
    some file in config.files
    some object in input.evidence.predicate.bom.components
    object.name == file
    some prop in object.properties
    prop.name == "last_commit"
    author := get_commit_author(prop.value)
    not any_match(author)
    r = {
            "type": "mismatching_author",
            "details": {
                "file": file,
                "author": author,
            }
        }
    }
}

any_match(author) {
    some id in config.ids
    contains(author, id)
}

get_commit_author(hash) := h {
    some object in input.evidence.predicate.bom.components
    object.name == hash
    some prop in object.properties
    prop.name == "Author"
    h := prop.value
}