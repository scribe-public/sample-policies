# Create you own results policy rule

## Description

This ruls enables you to create the results directly from the policy rule `yml` file.

Rule configuration:

<!--
{
    "command": "cat data.yml"
}
-->
<!-- { "object-type": "command-output-start" } -->
```bash
name: my-rule
path: data.rego
description: "my description"

evidence:
  signed: false

with:
  allow: true
  short_description: This is a short description
  description: This is a lonnnnnnnnnnnnnng description
  reason: The reason is thao within
  violations:
    - violation1: "thing 1"
    - violation2: "thing 2"
      something2:
        - some
        - thing


```
<!-- { "object-type": "command-output-end" } -->


Just fill in - true or false, reasons, violation detail etc.

## How to use

Create a some target attestation:

<!--
{
    "command": "valint bom busybox:latest 2>&1",
    "print_command": true
}
-->
<!-- { "object-type": "command-output-start" } -->
```bash
valint bom busybox:latest 2>&1
```
```bash
[0;90m[2024-05-30 09:57:26][0m [0;32m INFO[0m[0;36m enabled:[0m [cache-storer] using evidence storer
[0;90m[2024-05-30 09:57:26][0m [0;32m INFO[0m[0;36m target:[0m collecting context, Type: local
[0;90m[2024-05-30 09:57:26][0m [0;32m INFO[0m[0;36m target:[0m analyzing [0;32mtarget[0m=docker:busybox:latest
[0;90m[2024-05-30 09:57:26][0m [0;32m INFO[0m[0;36m target:[0m docker:busybox:latest analyzing success
[0;90m[2024-05-30 09:57:26][0m [0;32m INFO[0m[0;36m cocosign:[0m config selection, default: sigstore, Scheme: docker
[0;90m[2024-05-30 09:57:26][0m [0;32m INFO[0m[0;36m output:[0m File write to FS, Path: /home/user/.cache/valint/sha256-a416a98b71e224a31ee99cff8e16063554498227d2b696152a9c3e0aa65e5824.bom.json
[0;90m[2024-05-30 09:57:26][0m [0;32m INFO[0m[0;36m storer:[0m [cache] upload success [0;32mref[0m=/home/user/.cache/valint/sha256-a416a98b71e224a31ee99cff8e16063554498227d2b696152a9c3e0aa65e5824.bom.json [0;32mtype[0m=cache
[0;90m[2024-05-30 09:57:26][0m [0;32m INFO[0m environment-context [0;32mcontent_body_type[0m=cyclonedx-json [0;32mcontent_type[0m=cyclonedx-json [0;32mcontext_type[0m=local [0;32mcreated[0m=2023-07-18T23:19:33.655005962Z [0;32mformat_encoding[0m=json [0;32mformat_type[0m=cyclonedx [0;32mformat_version[0m=1.5 [0;32mgit_branch[0m=demo-data-rules [0;32mgit_commit[0m=a3ac9bc7c21c22667873f43af41f444eac91c0f9 [0;32mgit_ref[0m=refs/heads/demo-data-rules [0;32mgit_url[0m=https://github.com/scribe-public/sample-policies.git [0;32mhostname[0m=thinkpad [0;32mimageID[0m=sha256:a416a98b71e224a31ee99cff8e16063554498227d2b696152a9c3e0aa65e5824 [0;32minput_name[0m=busybox [0;32minput_scheme[0m=docker [0;32minput_tag[0m=latest [0;32mplatform[0m=linux/amd64 [0;32mrepoDigest[0m=[busybox@sha256:3fbc632167424a6d997e74f52b878d7cc478225cffac6bc977eedfe51c7f4e79] [0;32msbomgroup[0m=container [0;32msbomhashs[0m=[sha256-3fbc632167424a6d997e74f52b878d7cc478225cffac6bc977eedfe51c7f4e79 sha256-a416a98b71e224a31ee99cff8e16063554498227d2b696152a9c3e0aa65e5824] [0;32msbomname[0m=index.docker.io/library/busybox:latest [0;32msbompurl[0m=pkg:docker/index.docker.io/library/busybox:latest@sha256:a416a98b71e224a31ee99cff8e16063554498227d2b696152a9c3e0aa65e5824?arch=amd64 [0;32msbomtype[0m=container [0;32msbomversion[0m=sha256:a416a98b71e224a31ee99cff8e16063554498227d2b696152a9c3e0aa65e5824 [0;32msigned[0m=false [0;32msize[0m=4.26155e+06 [0;32mtag[0m=[latest 1.36.1 latest] [0;32mtarget_type[0m=container [0;32mtimestamp[0m=2024-05-30T09:57:26+03:00 [0;32mtool[0m=valint [0;32mtool_vendor[0m=Scribe Security [0;32mtool_version[0m=1.4.1-4 [0;32muser[0m=user
[0;90m[2024-05-30 09:57:26][0m [0;32m INFO[0m[0;36m cyclonedx-json:[0m evidence generated successfully
[0;90m[2024-05-30 09:57:26][0m [0;32m INFO[0m[0;36m event:[0m <14>1 2024-05-30T09:57:26.507478+03:00 thinkpad valint 21764 1001 - Artifact busybox:latest.
```
<!-- { "object-type": "command-output-end" } -->


Evaluate the policy:
<!--
{
    "command": "valint verify busybox:latest --rule data.yml 2>&1",
    "print_command": true
}
-->
<!-- { "object-type": "command-output-start" } -->
```bash
valint verify busybox:latest --rule data.yml 2>&1
```
```bash
[0;90m[2024-05-30 09:57:26][0m [0;32m INFO[0m[0;36m enabled:[0m [cache-storer] using evidence storer
[0;90m[2024-05-30 09:57:26][0m [0;32m INFO[0m[0;36m target:[0m analyzing [0;32mtarget[0m=docker:busybox:latest
[0;90m[2024-05-30 09:57:27][0m [0;33m WARN[0m[0;36m git:[0m stat failed%!(EXTRA <nil>)
[0;90m[2024-05-30 09:57:27][0m [0;32m INFO[0m[0;36m git:[0m cloning remote repository: https://github.com/scribe-public/sample-policies @ refs/heads/dev, Depth: 1
Enumerating objects: 483, done.
Counting objects:   0% (1/483)
Counting objects:   1% (5/483)
Counting objects:   2% (10/483)
Counting objects:   3% (15/483)
Counting objects:   4% (20/483)
Counting objects:   5% (25/483)
Counting objects:   6% (29/483)
Counting objects:   7% (34/483)
Counting objects:   8% (39/483)
Counting objects:   9% (44/483)
Counting objects:  10% (49/483)
Counting objects:  11% (54/483)
Counting objects:  12% (58/483)
Counting objects:  13% (63/483)
Counting objects:  14% (68/483)
Counting objects:  15% (73/483)
Counting objects:  16% (78/483)
Counting objects:  17% (83/483)
Counting objects:  18% (87/483)
Counting objects:  19% (92/483)
Counting objects:  20% (97/483)
Counting objects:  21% (102/483)
Counting objects:  22% (107/483)
Counting objects:  23% (112/483)
Counting objects:  24% (116/483)
Counting objects:  25% (121/483)
Counting objects:  26% (126/483)
Counting objects:  27% (131/483)
Counting objects:  28% (136/483)
Counting objects:  29% (141/483)
Counting objects:  30% (145/483)
Counting objects:  31% (150/483)
Counting objects:  32% (155/483)
Counting objects:  33% (160/483)
Counting objects:  34% (165/483)
Counting objects:  35% (170/483)
Counting objects:  36% (174/483)
Counting objects:  37% (179/483)
Counting objects:  38% (184/483)
Counting objects:  39% (189/483)
Counting objects:  40% (194/483)
Counting objects:  41% (199/483)
Counting objects:  42% (203/483)
Counting objects:  43% (208/483)
Counting objects:  44% (213/483)
Counting objects:  45% (218/483)
Counting objects:  46% (223/483)
Counting objects:  47% (228/483)
Counting objects:  48% (232/483)
Counting objects:  49% (237/483)
Counting objects:  50% (242/483)
Counting objects:  51% (247/483)
Counting objects:  52% (252/483)
Counting objects:  53% (256/483)
Counting objects:  54% (261/483)
Counting objects:  55% (266/483)
Counting objects:  56% (271/483)
Counting objects:  57% (276/483)
Counting objects:  58% (281/483)
Counting objects:  59% (285/483)
Counting objects:  60% (290/483)
Counting objects:  61% (295/483)
Counting objects:  62% (300/483)
Counting objects:  63% (305/483)
Counting objects:  64% (310/483)
Counting objects:  65% (314/483)
Counting objects:  66% (319/483)
Counting objects:  67% (324/483)
Counting objects:  68% (329/483)
Counting objects:  69% (334/483)
Counting objects:  70% (339/483)
Counting objects:  71% (343/483)
Counting objects:  72% (348/483)
Counting objects:  73% (353/483)
Counting objects:  74% (358/483)
Counting objects:  75% (363/483)
Counting objects:  76% (368/483)
Counting objects:  77% (372/483)
Counting objects:  78% (377/483)
Counting objects:  79% (382/483)
Counting objects:  80% (387/483)
Counting objects:  81% (392/483)
Counting objects:  82% (397/483)
Counting objects:  83% (401/483)
Counting objects:  84% (406/483)
Counting objects:  85% (411/483)
Counting objects:  86% (416/483)
Counting objects:  87% (421/483)
Counting objects:  88% (426/483)
Counting objects:  89% (430/483)
Counting objects:  90% (435/483)
Counting objects:  91% (440/483)
Counting objects:  92% (445/483)
Counting objects:  93% (450/483)
Counting objects:  94% (455/483)
Counting objects:  95% (459/483)
Counting objects:  96% (464/483)
Counting objects:  97% (469/483)
Counting objects:  98% (474/483)
Counting objects:  99% (479/483)
Counting objects: 100% (483/483)
Counting objects: 100% (483/483), done.
Compressing objects:   0% (1/299)
Compressing objects:   1% (3/299)
Compressing objects:   2% (6/299)
Compressing objects:   3% (9/299)
Compressing objects:   4% (12/299)
Compressing objects:   5% (15/299)
Compressing objects:   6% (18/299)
Compressing objects:   7% (21/299)
Compressing objects:   8% (24/299)
Compressing objects:   9% (27/299)
Compressing objects:  10% (30/299)
Compressing objects:  11% (33/299)
Compressing objects:  12% (36/299)
Compressing objects:  13% (39/299)
Compressing objects:  14% (42/299)
Compressing objects:  15% (45/299)
Compressing objects:  16% (48/299)
Compressing objects:  17% (51/299)
Compressing objects:  18% (54/299)
Compressing objects:  19% (57/299)
Compressing objects:  20% (60/299)
Compressing objects:  21% (63/299)
Compressing objects:  22% (66/299)
Compressing objects:  23% (69/299)
Compressing objects:  24% (72/299)
Compressing objects:  25% (75/299)
Compressing objects:  26% (78/299)
Compressing objects:  27% (81/299)
Compressing objects:  28% (84/299)
Compressing objects:  29% (87/299)
Compressing objects:  30% (90/299)
Compressing objects:  31% (93/299)
Compressing objects:  32% (96/299)
Compressing objects:  33% (99/299)
Compressing objects:  34% (102/299)
Compressing objects:  35% (105/299)
Compressing objects:  36% (108/299)
Compressing objects:  37% (111/299)
Compressing objects:  38% (114/299)
Compressing objects:  39% (117/299)
Compressing objects:  40% (120/299)
Compressing objects:  41% (123/299)
Compressing objects:  42% (126/299)
Compressing objects:  43% (129/299)
Compressing objects:  44% (132/299)
Compressing objects:  45% (135/299)
Compressing objects:  46% (138/299)
Compressing objects:  47% (141/299)
Compressing objects:  48% (144/299)
Compressing objects:  49% (147/299)
Compressing objects:  50% (150/299)
Compressing objects:  51% (153/299)
Compressing objects:  52% (156/299)
Compressing objects:  53% (159/299)
Compressing objects:  54% (162/299)
Compressing objects:  55% (165/299)
Compressing objects:  56% (168/299)
Compressing objects:  57% (171/299)
Compressing objects:  58% (174/299)
Compressing objects:  59% (177/299)
Compressing objects:  60% (180/299)
Compressing objects:  61% (183/299)
Compressing objects:  62% (186/299)
Compressing objects:  63% (189/299)
Compressing objects:  64% (192/299)
Compressing objects:  65% (195/299)
Compressing objects:  66% (198/299)
Compressing objects:  67% (201/299)
Compressing objects:  68% (204/299)
Compressing objects:  69% (207/299)
Compressing objects:  70% (210/299)
Compressing objects:  71% (213/299)
Compressing objects:  72% (216/299)
Compressing objects:  73% (219/299)
Compressing objects:  74% (222/299)
Compressing objects:  75% (225/299)
Compressing objects:  76% (228/299)
Compressing objects:  77% (231/299)
Compressing objects:  78% (234/299)
Compressing objects:  79% (237/299)
Compressing objects:  80% (240/299)
Compressing objects:  81% (243/299)
Compressing objects:  82% (246/299)
Compressing objects:  83% (249/299)
Compressing objects:  84% (252/299)
Compressing objects:  85% (255/299)
Compressing objects:  86% (258/299)
Compressing objects:  87% (261/299)
Compressing objects:  88% (264/299)
Compressing objects:  89% (267/299)
Compressing objects:  90% (270/299)
Compressing objects:  91% (273/299)
Compressing objects:  92% (276/299)
Compressing objects:  93% (279/299)
Compressing objects:  94% (282/299)
Compressing objects:  95% (285/299)
Compressing objects:  96% (288/299)
Compressing objects:  97% (291/299)
Compressing objects:  98% (294/299)
Compressing objects:  99% (297/299)
Compressing objects: 100% (299/299)
Compressing objects: 100% (299/299), done.
Total 483 (delta 286), reused 266 (delta 175), pack-reused 0
[0;90m[2024-05-30 09:57:27][0m [0;32m INFO[0m[0;36m git:[0m cloning success: https://github.com/scribe-public/sample-policies @ refs/heads/dev, Depth: 1
[0;90m[2024-05-30 09:57:27][0m [0;32m INFO[0m[0;36m git:[0m HEAD 1d46a0df3fb181a81ceb4fbca878fc7cf676cbfb,
[0;90m[2024-05-30 09:57:27][0m [0;32m INFO[0m[0;36m cocosign:[0m config selection, default: sigstore, Scheme: docker
[0;90m[2024-05-30 09:57:27][0m [0;32m INFO[0m environment-context [0;32mcontext_type[0m=local [0;32mcreated[0m=2023-07-18T23:19:33.655005962Z [0;32mgit_branch[0m=demo-data-rules [0;32mgit_commit[0m=a3ac9bc7c21c22667873f43af41f444eac91c0f9 [0;32mgit_ref[0m=refs/heads/demo-data-rules [0;32mgit_url[0m=https://github.com/scribe-public/sample-policies.git [0;32mhostname[0m=thinkpad [0;32mimageID[0m=sha256:a416a98b71e224a31ee99cff8e16063554498227d2b696152a9c3e0aa65e5824 [0;32minput_name[0m=busybox [0;32minput_scheme[0m=docker [0;32minput_tag[0m=latest [0;32mplatform[0m=linux/amd64 [0;32mpredicate_type[0m=http://scribesecurity.com/evidence/generic/v0.1 [0;32mrepoDigest[0m=[busybox@sha256:3fbc632167424a6d997e74f52b878d7cc478225cffac6bc977eedfe51c7f4e79] [0;32msbomgroup[0m=container [0;32msbomhashs[0m=[sha256-3fbc632167424a6d997e74f52b878d7cc478225cffac6bc977eedfe51c7f4e79 sha256-a416a98b71e224a31ee99cff8e16063554498227d2b696152a9c3e0aa65e5824] [0;32msbomname[0m=index.docker.io/library/busybox:latest [0;32msbompurl[0m=pkg:docker/index.docker.io/library/busybox:latest@sha256:a416a98b71e224a31ee99cff8e16063554498227d2b696152a9c3e0aa65e5824?arch=amd64 [0;32msbomtype[0m=container [0;32msbomversion[0m=sha256:a416a98b71e224a31ee99cff8e16063554498227d2b696152a9c3e0aa65e5824 [0;32msigned[0m=false [0;32msize[0m=4.26155e+06 [0;32mtag[0m=[latest 1.36.1 latest] [0;32mtarget_type[0m=container [0;32mtimestamp[0m=2024-05-30T09:57:26+03:00 [0;32muser[0m=user
[0;90m[2024-05-30 09:57:27][0m [0;32m INFO[0m[0;36m enabled:[0m [rekor-storer] using storer
[0;90m[2024-05-30 09:57:27][0m [0;32m INFO[0m[0;36m enabled:[0m [fulcio-verifier] using verifier
[0;90m[2024-05-30 09:57:27][0m [0;32m INFO[0m[0;36m default:[0m [verify-artifact] [my-rule] no format provided
[0;90m[2024-05-30 09:57:27][0m [0;32m INFO[0m[0;36m storer:[0m [cache] download success, Ref: /home/user/.cache/valint/sha256-a416a98b71e224a31ee99cff8e16063554498227d2b696152a9c3e0aa65e5824.bom.json
[0;90m[2024-05-30 09:57:27][0m [0;32m INFO[0m[0;36m default:[0m [verify-artifact] [my-rule] no format provided
[0;90m[2024-05-30 09:57:27][0m [0;32m INFO[0m[0;36m default:[0m [verify-artifact] [my-rule] [] allow: true - The reason is thao within
[0;90m[2024-05-30 09:57:27][0m [0;33m WARN[0m[0;36m default:[0m [verify-artifact] [my-rule] [Invalid Report] check-violation {
 "violation1": "thing 1"
}
[0;90m[2024-05-30 09:57:27][0m [0;33m WARN[0m[0;36m default:[0m [verify-artifact] [my-rule] [Invalid Report] check-violation {
 "something2": [
  "some",
  "thing"
 ],
 "violation2": "thing 2"
}
[0;90m[2024-05-30 09:57:27][0m [0;32m INFO[0m[0;36m default:[0m [verify-artifact] [my-rule] rule passed
[0;90m[2024-05-30 09:57:27][0m [0;32m INFO[0m[0;36m rule:[0m [default] [verify-artifact] [my-rule] verified
[0;90m[2024-05-30 09:57:27][0m [0;32m INFO[0m[0;36m policy:[0m [default] verified
[0;90m[2024-05-30 09:57:27][0m [0;32m INFO[0m Policy "default" Evaluation Summary: 
┌──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
│ Policy "default" Evaluation Summary                                                                                                  │
├─────────────────────────┬───────┬────────┬────────────────────────┬───────────────────┬──────────────────────────────────────────────┤
│ RULE NAME               │ LEVEL │ SIGNED │ SIGNATURE VERIFICATION │ POLICY EVALUATION │ COMMENT                                      │
├─────────────────────────┼───────┼────────┼────────────────────────┼───────────────────┼──────────────────────────────────────────────┤
│ my-rule                 │ error │ false  │ passed                 │ passed            │ 1/1 evidence origin and signature verified,  │
│                         │       │        │                        │                   │ The reason is thao within                    │
├─────────────────────────┼───────┼────────┼────────────────────────┼───────────────────┼──────────────────────────────────────────────┤
│ AGGREGATE POLICY RESULT │       │        │                        │ PASSED            │                                              │
└─────────────────────────┴───────┴────────┴────────────────────────┴───────────────────┴──────────────────────────────────────────────┘

[0;90m[2024-05-30 09:57:27][0m [0;32m INFO[0m[0;36m output:[0m File write to FS, Path: /home/user/.cache/valint/sha256-a416a98b71e224a31ee99cff8e16063554498227d2b696152a9c3e0aa65e5824.sarif.json
[0;90m[2024-05-30 09:57:27][0m [0;32m INFO[0m[0;36m storer:[0m [cache] upload success [0;32mref[0m=/home/user/.cache/valint/sha256-a416a98b71e224a31ee99cff8e16063554498227d2b696152a9c3e0aa65e5824.sarif.json [0;32mtype[0m=cache
[0;90m[2024-05-30 09:57:27][0m [0;32m INFO[0m[0;36m event:[0m <14>1 2024-05-30T09:57:27.783219+03:00 thinkpad valint 21783 1007 - Policy 'default' with 'my-rule' rules.
```
<!-- { "object-type": "command-output-end" } -->

