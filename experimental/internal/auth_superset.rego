package internal.auth.superset
import future.keywords.in

package_loaded := true

auth(config) = v {
  v := config.auth
}

defined(path, field) {
    _ = path[field] 
}

query(url, config, args, token) := v {
        v := {
            "url": sprintf("%s/dataset/token", [url]),
            "method": "GET",
            "headers": {
                "Authorization": concat("",["Bearer ", token]),
                "Content-Type": "application/json"
            },
            "timeout": "20s"
        }
}

getTokenDebug(url, config, args, token) := v {
    v := {
         "request": query(url, config, args, token),
         "response:": http.send(query(url, config, args, token))
    }
}

getToken(url, config, args, token) := v {
    r := http.send(query(url, config, args, token))
    v := r.body.access_token
}