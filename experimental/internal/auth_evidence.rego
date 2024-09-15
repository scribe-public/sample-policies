package auth.evidence
import future.keywords.in

package_loaded := true


post(url, config) = v {
    v := http.send(query(url, config))
}

postDebug(url, config) = v {
    v := {
         "request": query(url, config),
         "response:": http.send(query(url, config))
    }
}

query(url, config) := v {
    auth_body := get_auth_body(config)
    v := {
        "url": sprintf("%s/v1/login", [url]),
        "method": "POST",
        "body": auth_body,
        "headers": {
            "Content-Type": "application/json"
        },
        "timeout": "30m",
        "max_retry_attempts": 5,
    }
}

get_auth_body(config) := v {
    client_id_set(config)
    v := {
        "client_id": config.client_id,
        "client_secret": config.client_secret,
    }
}

get_auth_body(config) := v {
    not client_id_set(config)
    v := {
        "api_token": config.client_secret,
    }
}

# get_auth_body(config) := v {
#     not client_id_set(config)
#     decoded := base64.decode(config.client_secret)
#     a := split(decoded, ":")
#     v := {
#         "client_id": a[0],
#         "client_secret": a[1],
#     }
# }

client_id_set(config) {
    config.client_id != ""
}

getToken(url, config) := v {
    v := post(url, config).body.token
} 
