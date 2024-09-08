package verify

import future.keywords.in
import future.keywords.every

default allow := false

default violations := []

table := input.evidence.predicate.content
default template :=""

columnname := input.config.args.column
values := input.config.args.values
template := input.config.args.template

default condition_col = ""
default condition_vals = []

condition_col := input.config.args.condition.column
condition_vals := input.config.args.condition.values

# table := [
#   {
#     "requirement": "R-1",
#     "Description": "have organization security responsibilities policy",
#     "Status": "Comply",
#     "Evidence": "https://fileserver/myevidence",
#     "Remarks": "No remarks",
#     "Date": "9/6/2024",
#     "Weight": 1
#   },
#   {
#     "requirement": "R-2",
#     "Description": "have incidnet response policy",
#     "Status": "Compliant",
#     "Evidence": "",
#     "Remarks": "",
#     "Date": "",
#     "Weight": 2
#   }
# ]

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": columnname,
			"details": violations,
		},
		"summary": [{
			"allow": allow,
			"reason": reason,
			"violations": count(violations),
		}],
	}
}

reason = v {
    comply_lines_exist
	v := sprintf("%d violations | %d max allowed", [count(violations), 0])
}

reason = v {
    not comply_lines_exist
    v := "No lines comply to the condition specified"
}

allow {
    comply_lines_exist
	count(violations) == 0
}

condition(condition_col, condition_vals, l) {
    condition_col != ""
    every value in condition_vals {
        glob.match(value, null, l[condition_col])
    }
}

condition("", _, _) {
    true
}

comply_lines_exist = t {
    some i
    l := table[i]
    t := condition(condition_col, condition_vals, l)
}

violations = j {
 	j := {r | 
        some i
        l := table[i]
        c := condition(condition_col, condition_vals, l)
        c
        every value in values {
            not (glob.match(value, null, l[columnname]))
        }

        r := {
            "line": l,
            "reason": strings.render_template(template, l),
            "condition": c
        }
    }
}

