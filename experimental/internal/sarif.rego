package internal.sarif

import future.keywords.if
import future.keywords.in

# set_config(my_config)
# allow := sarif.allow(config)
# violations:=sarif.violations(config)
# verify:=sarif.verify(config)

# The following are internal functions
# default allow(config) := false
# default violations(config) := false

get_rules(output_file) = rules {
   rules := output_file.runs[0].tool.driver.rules
}


get_results(output_file) = results {
   results := output_file.runs[0].results
}

filtered_runs(ids, levels, precisions, ignore, of) = { id |
   rules = get_rules(of)
   rule = rules[_]
   id_check(rule.id, ids)
   # rule.id in config.rule_ids
   level_check(rule, levels)
   # rule.defaultConfiguration.level in config.rule_level;
   precision_check(rule, precisions)
   # rule.properties.precision in config.precision;
   ignore_check(rule.id, ignore)
   # not (rule.id in config.ignore);
   id = rule.id
} if { not (ignore == "all") } else := []

level_check (rule, filters) {
   count(filters) == 0
}

level_check (rule, filters) {
   not rule.defaultConfiguration.level
}

level_check (rule, filters) {
   rule.defaultConfiguration.level in filters
}

precision_check (rule, filters) {
   count(filters) == 0
}

precision_check (rule, filters) {
   not rule.properties
}

precision_check (rule, filters) {
   not rule.properties.precision
   rule.properties["security-severity"]
   rule.properties["security-severity"] in filters
}

precision_check (rule, filters) {
   rule.properties.precision
   rule.properties.precision in filters
}

id_check (id, filters) {
   count(filters) == 0
}

id_check (id, filters) {
   id in filters
}

ignore_check (ignore, filters) {
   count(filters) == 0
}

ignore_check (ignore, filters) {
   not (ignore in filters)
}

filter_list (ids, levels, precisions, ignore, of) = { summary |
   result = of.runs[0].results[_]
   lst := filtered_runs(ids, levels, precisions, ignore, of)
   result.ruleId in lst
   tmh := tool_msg_header(of)
   summary = {
      "ruleID": result.ruleId,
      "file": result.locations[0].physicalLocation.artifactLocation.uri,
      "region": result.locations[0].physicalLocation.region,
      tmh: result.message.text,
   }
} if { count(filtered_runs(ids, levels, precisions, ignore, of)) > 0 } else := []

tool_msg_header(of) := v {
   of.runs[0].tool.driver.name
   v := sprintf("%s_message", [lower(of.runs[0].tool.driver.name)])
}
tool_msg_header(of) := v {
   not of.runs[0].tool.driver.name
   v := "tool_message"
}

violations(config) = res {
   input.evidence.predicate.mimeType == "application/json"
   results := input.evidence.predicate.content
   res := filter_list(config.rule_ids, config.rule_level, config.precision, config.ignore, results)
}

violations(config) = res {
   d := base64.decode(input.evidence.predicate.content)
   results := json.unmarshal(d)
   res := filter_list(config.rule_ids, config.rule_level, config.precision, config.ignore, results)
}

allow(config) := {
   count(violations(config)) <= config.max_allowed
}

