package verify

default allow = false
default violations = []

config:=["mit","apache"]

verify = v {
    v := {
        "allow": allow,
        "details": json.marshal(hf_url),
    }
}

allow {
    some l
    l = config[_]
    hf_info.cardData.license == l
}

hf_repo := repo {
    repo_url := input.evidence.predicate.bom.metadata.component.name
    r1 := replace(repo_url,"https://huggingface.co/","")
    r2 := replace(r1,".git","")
    repo := r2
}

hf_url := concat("/",["https://huggingface.co/api/models",hf_repo])

hf_info := info {
    query:= {
        "method": "GET",
        "url": hf_url,
        "timeout": "30s"
    }
    info := http.send(query).body
}
