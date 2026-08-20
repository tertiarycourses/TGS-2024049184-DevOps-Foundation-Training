# Lab 04 — Prioritise Problems by Severity, Frequency and Impact

Course: DevOps Foundation Training (TGS-2024049184)
Version: v4.0
Topic: 04
Estimated time: 35–45 minutes

## Workplace scenario

Northstar Retail can fund only two problem-remediation initiatives this quarter. Leaders disagree because each team uses a different definition of priority.

## Objective

Apply K3 and A3 by defining evidence, then K4 and A4 by applying a transparent prioritisation rule.

## What you will produce

A ranked problem_priority.csv and priority_matrix.png with documented scoring assumptions.

## Prerequisites

- R 4.x available as `Rscript`.
- Work from this lab folder so relative paths resolve.
- Use only the supplied synthetic data; no internet connection or external package is required.
- Preserve the source data. Make experimental changes in a copied file, then restore it.

## Folder map

```text
Lab-04-problem-prioritisation/
├── README.md / README.pdf
├── CHECKLIST.md / CHECKLIST.pdf
├── problem_prioritisation.R
├── data/
└── output/            # reproducible evidence produced by the R script
```

## Detailed procedure

### Step 1 — Review problems.csv and confirm all scoring fields use the documented 1–5 scale.

```bash
Rscript -e 'd <- read.csv("data/problems.csv"); summary(d)'
```

Record what you observed before continuing.
### Step 2 — Run problem_prioritisation.R to calculate impact-weighted priority and rank the backlog.

```bash
Rscript problem_prioritisation.R
```

Record what you observed before continuing.
### Step 3 — Inspect the top two problems and explain why they rank above a severe but low-confidence item.

```bash
Rscript -e 'print(read.csv("output/problem_priority.csv"))'
```

Record what you observed before continuing.
### Step 4 — Open the severity-frequency matrix and compare visual position with the final score.

```bash
open output/priority_matrix.png
```

Record what you observed before continuing.
### Step 5 — Run one sensitivity test by increasing an effort estimate or reducing confidence, then restore the source file.

```bash
Rscript problem_prioritisation.R
```

Record what you observed before continuing.
### Step 6 — Document the scoring policy, selected initiatives and trade-off in CHECKLIST.md.

```bash
open CHECKLIST.md
```

Record what you observed before continuing.

## Evidence to retain

- [ ] output/problem_priority.csv
- [ ] output/priority_matrix.png
- [ ] completed CHECKLIST.md

## Acceptance criteria

- Formula is explicit
- Unique rank for all problems
- Top two selected with evidence
- Sensitivity test is explained

## Verification

Every score is reproducible from the published formula; ranks are unique; the top two recommendations cite impact, evidence confidence and effort.

## Troubleshooting

- `cannot open file`: confirm your terminal is in this lab folder.
- `Rscript: command not found`: install R, reopen the terminal and run `Rscript --version`.
- A validation `stop(...)` message is evidence that the input broke a stated rule; inspect the named field rather than bypassing the check.
- If an output looks wrong, compare row counts and IDs with the source CSV before changing the analysis.

## Clean rerun

Delete only the files inside `output/`, then run the R script again. The source CSV and script remain unchanged.
