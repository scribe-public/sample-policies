package verify

import data.scribe as scribe
import future.keywords.in

default allow := false
default asset := {}
default errors := []

asset = scribe.get_asset_data(input.evidence)

##########################################################################
# Time Calculation
##########################################################################
nanosecs_per_second = 1000 * 1000 * 1000
nanosecs_per_day = (24 * 60 * 60) * nanosecs_per_second
maximum_age = input.config.args.max_days * nanosecs_per_day

##########################################################################
# Check for Base Images
##########################################################################
# found_base_image is true if at least one component (group "container") 
# has any property whose name ends with "isbaseimage" (case-insensitive) 
# and whose value is "true".
found_base_image {
    some c in input.evidence.predicate.bom.components
    c.group == "container"
    some p in c.properties
    endswith(lower(p.name), "isbaseimage")
    lower(p.value) == "true"
}

##########################################################################
# Outdated Base Images Violations
##########################################################################
# For each base image, if the "created" timestamp is older than allowed,
# record a violation including the component version.
base_image_violations = [ v |
    some c in input.evidence.predicate.bom.components
    c.group == "container"
    
    # Identify base images by any property ending with "isbaseimage" set to "true".
    some p in c.properties
    endswith(lower(p.name), "isbaseimage")
    lower(p.value) == "true"
    
    # Get the 'created' property.
    some cp in c.properties
    cp.name == "created"
    
    created_ns := time.parse_rfc3339_ns(cp.value)
    created_ns > 0
    time.now_ns() >= created_ns + maximum_age
    
    v := {
         "component": c.name,
         "version": c.version,
         "created": cp.value,
         "max_days": input.config.args.max_days
    }
]

##########################################################################
# Define Violations
##########################################################################
violations = v {
    found_base_image
    v = base_image_violations
} else = v {
    not found_base_image
    v = [{ "error": "No base image data found." }]
}

##########################################################################
# Compute Valid Base Image Names (with Version)
##########################################################################
valid_base_image_names = [ sprintf("%v (%v)", [c.name, c.version]) |
    some c in input.evidence.predicate.bom.components
    c.group == "container"
    some p in c.properties
    endswith(lower(p.name), "isbaseimage")
    lower(p.value) == "true"
    some cp in c.properties
    cp.name == "created"
    created_ns := time.parse_rfc3339_ns(cp.value)
    created_ns > 0
    time.now_ns() < created_ns + maximum_age
]

##########################################################################
# Decision Logic
##########################################################################
allow {
    found_base_image
    count(violations) == 0
}

##########################################################################
# Reason for the Summary
##########################################################################
reason = msg {
    not found_base_image
    msg := "Base image component not found."
}
reason = msg {
    found_base_image
    not allow
    msg := sprintf("One or more base images exceed the age limit of %v days.", [input.config.args.max_days])
}
reason = msg {
    found_base_image
    allow
    valid_names := sprintf("%v", [valid_base_image_names])
    msg := sprintf("All base images %v are within the age limit of %v days.", [valid_names, input.config.args.max_days])
}

##########################################################################
# Final Verify Object
##########################################################################
verify = result {
    result := {
        "allow": allow,
        "errors": errors,
        "violation": {
            "type": "Base Image Too Old",
            "details": violations
        },
        "asset": asset,
        "summary": [{
            "allow": allow,
            "reason": reason,
            "violations": count(violations)
        }]
    }
}
