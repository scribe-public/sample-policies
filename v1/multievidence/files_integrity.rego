package verify
import future.keywords

default allow = false

default violations = []

default matchingPaths = []

package_loaded := true

verify = v {
	v := {
		"allow": allow,
		"violation": {
			"type": "File integrity check",
			"details": violations,
		},
		"summary": [{
			"allow": allow,
			"reason": reason,
			"violations": count(violations),
		}],
	}
}

allow {
	count(violations) = 0
}

reason = v {
	allow
	v := "no file inetgrity mismatches were found in the given path" # TODO: add path
}

reason = v {
	not allow
	v := "file integrity mismatches were found in the given path" # TODO: add path
}

violations = j {
	j := {r |
        some k
		new_sbom_components[k] != ref_sbom_components[k]
        r := {
        	"file": k
        }
	}
}

new_sbom := input.evidence.predicate.bom #data["tree"]["chat2"] #input.config.args.sbom, maybe need to load to json object from some string
decoded_sbom := json.unmarshal(base64.decode(input.config.args.ref_sbom)) #data["tree"]["chat1"] #input.evidence.predicate.bom
ref_sbom := decoded_sbom.predicate.bom

new_sbom_components := component_dict(new_sbom)
ref_sbom_components := component_dict(ref_sbom)

component_dict(s) =  { k:v |
	comps := s["components"]
	some i
	c = comps[i]
	b = c["bom-ref"]
	startswith(b,input.config.args.path_prefix)
	k := split(b, "?ID=")[0]
	v := c["hashes"][0]["content"]
}
