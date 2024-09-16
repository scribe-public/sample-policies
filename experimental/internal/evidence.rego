package internal.evidence
import future.keywords.in
import future.keywords.every

package_loaded := true

config = v {
  v := input.config.stores.scribe
}

auth(config) = v {
  v := config.auth
}

serviceURL(config) = v {
  v := config.service.url
}

get(url, token) = response {
  request := {"method": "GET",
              "url": url,
              "headers": {
                "Authorization": concat("",["Bearer ", token]),
                "Accept": "application/json"
                },
               "timeout" : "100s",
              "raise_error": false,
              "force_json_decode": true,
              }

  response := http.send(request)
}


post(url, upload_data, token) = response {
  request := {"method": "POST",
              "url": url,
              "headers": {
                "Authorization": concat("",["Bearer ", token]),
                "Accept": "application/vnd.github.v3+json",
                "Content-Type": "application/json"
              },
              "raise_error": false,
              "body": upload_data
             }
  response := http.send(request)
}

login(config) = v {
  v := data.internal.auth.evidence.getToken(serviceURL(config), config.auth)
}

errors[msg] {
  not login(config)
  msg := "login failed"
}

presignedURLByID(config, id) = v {
  url := concat("",[serviceURL(config), "/evidence/", id])
  r := get(url, login(config))
  v := r.body["presigned_url"]
}

List(config, obj) = v {
  url := concat("",[serviceURL(config), "/evidence/list"])
  r := post(url, obj, login(config))
  v := r.body["evidences"]
}

Download(config, id) := v {
  url := presignedURLByID(config, id)
  request := {"method": "GET",
                "url": url,
                "force_json_decode": true,
                "timeout" : 0
              }
  r := http.send(request)
  v := r.body
}

