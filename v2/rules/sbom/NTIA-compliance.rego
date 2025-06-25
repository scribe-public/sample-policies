package verify

import future.keywords.in

##########################################################################
# Defaults
##########################################################################
default allow := false
default violations := []
default errors := []

##########################################################################
# Retrieve Evidence Metadata
##########################################################################

metadata := input.evidence.predicate.bom.metadata

##########################################################################
# Authors: Existence and Validity
##########################################################################
authors_exist {
  metadata.authors != null
  count(metadata.authors) > 0
}

authors_has_empty_name {
  some i
  metadata.authors[i].name == ""
}

authors_has_empty_email {
  some i
  metadata.authors[i].email == ""
}

authors_ok {
  authors_exist
  not authors_has_empty_name
  not authors_has_empty_email
}

##########################################################################
# Supplier: Existence and Validity
##########################################################################
supplier_exists {
  metadata.supplier != null
}

supplier_has_name {
  metadata.supplier.name != ""
}

supplier_has_urls {
  metadata.supplier.url != null
  count(metadata.supplier.url) > 0
}

supplier_has_contacts {
  metadata.supplier.contact != null
  count(metadata.supplier.contact) > 0
}

supplier_has_valid_contact_email {
  some i
  metadata.supplier.contact[i].email != ""
}

supplier_ok {
  supplier_exists
  supplier_has_name
  supplier_has_urls
  supplier_has_contacts
  supplier_has_valid_contact_email
}

##########################################################################
# Optional Required Author
##########################################################################

# user provided a required_author
have_required_author {
  input.config.args.required_author != null
  input.config.args.required_author.name != null
  input.config.args.required_author.email != null
  input.config.args.required_author.name != ""
  input.config.args.required_author.email != ""
}

matches_required_author {
  some i
  lower(metadata.authors[i].name) == lower(input.config.args.required_author.name)
  lower(metadata.authors[i].email) == lower(input.config.args.required_author.email)
}

# required_author_ok is OR: 
# (1) user didn’t provide or provided empty data 
required_author_ok {
  not have_required_author
}
# (2) user provided it, and we have a match
required_author_ok {
  have_required_author
  matches_required_author
}

##########################################################################
# Optional Required Supplier
##########################################################################

have_required_supplier {
  input.config.args.required_supplier != null
  input.config.args.required_supplier.name != null
  input.config.args.required_supplier.name != ""
}

matches_required_supplier {
  lower(metadata.supplier.name) == lower(input.config.args.required_supplier.name)
}

# required_supplier_ok is OR:
# (1) user didn’t provide or provided empty supplier data
required_supplier_ok {
  not have_required_supplier
}
# (2) user provided, and we have a match
required_supplier_ok {
  have_required_supplier
  matches_required_supplier
}

##########################################################################
# Final Decision
##########################################################################
allow {
  authors_ok
  supplier_ok
  required_author_ok
  required_supplier_ok
}

##########################################################################
# Violations
##########################################################################
final_violations = v {
  not authors_ok
  v = [{
    "error": "Authors section invalid. Must exist, be non-empty, and have no empty name/email."
  }]
} else = v {
  not supplier_ok
  v = [{
    "error": "Supplier section invalid. Check that the supplier has a name, URLs, and at least one contact with a non-empty email."
  }]
} else = v {
  have_required_author
  not matches_required_author
  v = [{
    "error": "Required author not found or does not match."
  }]
} else = v {
  have_required_supplier
  not matches_required_supplier
  v = [{
    "error": "Required supplier not found or does not match."
  }]
} else = v {
  v = []
}


##########################################################################
# Reason for Summary
##########################################################################
reason = msg {
  allow
  msg := "NTIA SBOM compliance check passed."
} else = msg {
  not allow
  msg := sprintf("NTIA SBOM compliance check failed: %v", [sprintf("%v", [final_violations])])
}

##########################################################################
# Final Verify Object
##########################################################################
verify = result {
  result := {
    "allow": allow,
    "errors": errors,
    "violation": {
      "type": "NTIA SBOM Compliance Check",
      "details": final_violations
    },
    "summary": [{
      "allow": allow,
      "reason": reason,
      "violations": count(final_violations)
    }]
  }
}
