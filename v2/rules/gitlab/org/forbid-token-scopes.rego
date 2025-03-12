package verify

import future.keywords.in
import data.scribe as scribe

default allow := false
default violations := []
default asset := {}

asset = scribe.get_asset_data(input.evidence)

verify = v {
  v := {
    "allow": allow,
    "violation": {
      "type": "Disallowed Token Scope",
      "details": violations,
    },
    "asset": asset,
    "summary": [{
      "allow": allow,
      "reason": reason,
      "violations": count(violations)
    }]
  }
}

# Allow if no violations were found.
allow {
  count(violations) == 0
}

# Reason messages for summary.
reason = msg {
  allow
  msg := "No tokens have disallowed scopes."
}
reason = msg {
  not allow
  msg := "Some tokens have disallowed scopes."
}

# Evaluate violations by iterating over tokens.
violations = [ v |
    some token in input.evidence.predicate.content[_].token
    token.result_object.revoked == false
    token.result_object.active == true
    not token_allowed(token.name)
    some scope in token.result_object.scopes
    match_any(scope)
    v := {
      "token": token.name,
      "scope": scope,
    }
]

# Helper: Returns true if the given scope matches any forbidden scope.
match_any(scope) {
  forbidden_scopes_list = input.config.args.project_scopes
  some forbidden_scope in forbidden_scopes_list
  forbidden_scope == scope
}

# Helper: Returns true if the token name is in the approved tokens list.
token_allowed(token_name) {
  approved_tokens = input.config.args.approved_tokens
  some t in approved_tokens
  lower(t) == lower(token_name)
}
