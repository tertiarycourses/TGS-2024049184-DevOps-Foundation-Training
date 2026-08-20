# Lab 05 — Diagnose Pipeline Flow and Cultural Debt

Course: DevOps Foundation Training (TGS-2024049184)
Version: v4.0
Topic: 05
Estimated time: 35–45 minutes

## Workplace scenario

Teams blame the test stage for slow delivery, but no one has quantified queue time, rework or manual hand-offs across the pipeline.

## Objective

Apply K4 and A4 by combining stage performance with visible queue and rework evidence to recommend a prioritised improvement.

## What you will produce

A pipeline_stage_summary.csv, pipeline_flow.png and a generative-culture recommendation.

## Prerequisites

- R 4.x available as `Rscript`.
- Work from this lab folder so relative paths resolve.
- Use only the supplied synthetic data; no internet connection or external package is required.
- Preserve the source data. Make experimental changes in a copied file, then restore it.

## Folder map

```text
Lab-05-pipeline-risk-review/
├── README.md / README.pdf
├── CHECKLIST.md / CHECKLIST.pdf
├── pipeline_risk_review.R
├── data/
└── output/            # reproducible evidence produced by the R script
```

## Detailed procedure

### Step 1 — Inspect pipeline_runs.csv and identify active time, wait time, failures and rework.

```bash
Rscript -e 'd <- read.csv("data/pipeline_runs.csv"); str(d)'
```

Record what you observed before continuing.
### Step 2 — Run pipeline_reliability.R to calculate stage-level flow and instability indicators.

```bash
Rscript pipeline_reliability.R
```

Record what you observed before continuing.
### Step 3 — Review pipeline_stage_summary.csv and identify the current constraint using evidence rather than reputation.

```bash
Rscript -e 'print(read.csv("output/pipeline_stage_summary.csv"))'
```

Record what you observed before continuing.
### Step 4 — Open pipeline_flow.png and locate the stage with the largest wait-to-active ratio.

```bash
open output/pipeline_flow.png
```

Record what you observed before continuing.
### Step 5 — Translate the finding into one CALMS improvement and one generative-culture behaviour.

```bash
open CHECKLIST.md
```

Record what you observed before continuing.
### Step 6 — Record a success metric and 30-day review date for the recommendation.

```bash
open CHECKLIST.md
```

Record what you observed before continuing.

## Evidence to retain

- [ ] output/pipeline_stage_summary.csv
- [ ] output/pipeline_flow.png
- [ ] completed CHECKLIST.md

## Acceptance criteria

- Constraint identified from data
- No individual-blame language
- CALMS dimension named
- Metric and review date recorded

## Verification

The identified constraint matches the maximum wait ratio; the recommendation changes a system condition and names an outcome measure.

## Troubleshooting

- `cannot open file`: confirm your terminal is in this lab folder.
- `Rscript: command not found`: install R, reopen the terminal and run `Rscript --version`.
- A validation `stop(...)` message is evidence that the input broke a stated rule; inspect the named field rather than bypassing the check.
- If an output looks wrong, compare row counts and IDs with the source CSV before changing the analysis.

## Clean rerun

Delete only the files inside `output/`, then run the R script again. The source CSV and script remain unchanged.
