package internal.superset.policy
import data.internal.superset.licences as licences_policy
import data.internal.superset.cve as cve_policy
import data.internal.superset.unmaintained as unmaintained_policy
import data.internal.superset.images as images_policy
import data.internal.superset.published as published_policy

images = v {
  v := {
    "allow": images_policy.Verify.allow,
    "violation": images_policy.Verify.violation,
    "errors": images_policy.Verify.errors,
    "summary": images_policy.Verify.summary,
  }
}

cve = v {
  v := {
    "allow": cve_policy.Verify.allow,
    "violation": cve_policy.Verify.violation,
    "errors": cve_policy.Verify.errors,
    "summary": cve_policy.Verify.summary,
  }
}

unmaintained = v {
  v := {
    "allow": unmaintained_policy.Verify.allow,
    "violation": unmaintained_policy.Verify.violation,
    "errors": unmaintained_policy.Verify.errors,
    "summary": unmaintained_policy.Verify.summary,
  }
}

licences = v {
  v := {
    "allow": licences_policy.Verify.allow,
    "violation": licences_policy.Verify.violation,
    "errors": licences_policy.Verify.errors,
    "summary": licences_policy.Verify.summary,
  }
}

published = v {
  v := {
    "allow": published_policy.Verify.allow,
    "violation": published_policy.Verify.violation,
    "errors": published_policy.Verify.errors,
    "summary": published_policy.Verify.summary,
  }
}