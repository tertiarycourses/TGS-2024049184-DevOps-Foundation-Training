# Lab 03 — Investigate Recurring Failure Causes with Pareto Analysis

Course: DevOps Foundation Training (TGS-2024049184)
Version: v4.0
Topic: 03
Estimated time: 35–45 minutes

## Workplace scenario

Pipeline failures are discussed anecdotally. The team needs a quantified Pareto view before choosing a root-cause investigation target.

## Objective

Apply K2 and A2 while preparing evidence for A3: distinguish symptoms from cause candidates and identify recurring categories worth deeper investigation.

## What you will produce

A cause_pareto.csv, pareto_failures.png and five_whys_template.csv.

## Prerequisites

- R 4.x available as `Rscript`.
- Work from this lab folder so relative paths resolve.
- Use only the supplied synthetic data; no internet connection or external package is required.
- Preserve the source data. Make experimental changes in a copied file, then restore it.

## Folder map

```text
Lab-03-root-cause-pareto/
├── README.md / README.pdf
├── CHECKLIST.md / CHECKLIST.pdf
├── root_cause_pareto.R
├── data/
└── output/            # reproducible evidence produced by the R script
```

## Detailed procedure

### Step 1 — Inspect failure_events.csv and distinguish observed category, symptom and lost-time fields.

```bash
Rscript -e 'd <- read.csv("data/failure_events.csv"); str(d)'
```

Record what you observed before continuing.
### Step 2 — Run root_cause_analysis.R to aggregate categories and calculate cumulative contribution.

```bash
Rscript root_cause_analysis.R
```

Record what you observed before continuing.
### Step 3 — Review cause_pareto.csv and select the smallest set of categories accounting for at least 80% of lost minutes.

```bash
Rscript -e 'print(read.csv("output/cause_pareto.csv"))'
```

Record what you observed before continuing.
### Step 4 — Open the Pareto chart and verify the bar and cumulative-line relationship.

```bash
open output/pareto_failures.png
```

Record what you observed before continuing.
### Step 5 — Complete five_whys_template.csv for the leading category using facts from the dataset; mark unsupported statements as hypotheses.

```bash
open output/five_whys_template.csv
```

Record what you observed before continuing.
### Step 6 — Record the selected investigation target and required next evidence in CHECKLIST.md.

```bash
open CHECKLIST.md
```

Record what you observed before continuing.

## Evidence to retain

- [ ] output/cause_pareto.csv
- [ ] output/pareto_failures.png
- [ ] completed output/five_whys_template.csv
- [ ] completed CHECKLIST.md

## Acceptance criteria

- Cumulative percentage ends at 100
- Leading cause is evidence-based
- 5 Whys separates facts and hypotheses
- Next evidence is specified

## Verification

LAB 03 PASS is printed; cumulative percentage ends at 100%; the leading category is supported by both count and lost-minute evidence.

## Troubleshooting

- `cannot open file`: confirm your terminal is in this lab folder.
- `Rscript: command not found`: install R, reopen the terminal and run `Rscript --version`.
- A validation `stop(...)` message is evidence that the input broke a stated rule; inspect the named field rather than bypassing the check.
- If an output looks wrong, compare row counts and IDs with the source CSV before changing the analysis.

## Clean rerun

Delete only the files inside `output/`, then run the R script again. The source CSV and script remain unchanged.
