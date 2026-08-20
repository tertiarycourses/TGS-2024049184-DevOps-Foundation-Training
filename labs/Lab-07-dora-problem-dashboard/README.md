# Lab 07 — Build a DORA and Problem-Management Evidence Dashboard

Course: DevOps Foundation Training (TGS-2024049184)
Version: v4.0
Topic: 07
Estimated time: 35–45 minutes

## Workplace scenario

Leadership wants one slide of delivery-performance evidence, while engineering needs definitions precise enough to reproduce the numbers.

## Objective

Apply K5 and A6 by calculating documented delivery metrics and linking them to tracked problem-management actions.

## What you will produce

A dora_metrics.csv, problem_actions.csv and dora_dashboard.png with metric definitions.

## Prerequisites

- R 4.x available as `Rscript`.
- Work from this lab folder so relative paths resolve.
- Use only the supplied synthetic data; no internet connection or external package is required.
- Preserve the source data. Make experimental changes in a copied file, then restore it.

## Folder map

```text
Lab-07-dora-problem-dashboard/
├── README.md / README.pdf
├── CHECKLIST.md / CHECKLIST.pdf
├── dora_problem_dashboard.R
├── data/
└── output/            # reproducible evidence produced by the R script
```

## Detailed procedure

### Step 1 — Review deployments.csv and problem_actions.csv; confirm each metric has the fields needed for reproducible calculation.

```bash
Rscript -e 'str(read.csv("data/deployments.csv")); str(read.csv("data/problem_actions.csv"))'
```

Record what you observed before continuing.
### Step 2 — Run dora_metrics.R to calculate throughput, instability and action-tracking measures.

```bash
Rscript dora_metrics.R
```

Record what you observed before continuing.
### Step 3 — Inspect dora_metrics.csv and compare the current five-metric DORA model with the historical four-key vocabulary in the v3.4 guide.

```bash
Rscript -e 'print(read.csv("output/dora_metrics.csv"))'
```

Record what you observed before continuing.
### Step 4 — Open dora_dashboard.png and identify one improvement hypothesis; do not rank individuals or unrelated services.

```bash
open output/dora_dashboard.png
```

Record what you observed before continuing.
### Step 5 — Review problem_actions.csv for overdue or unverified corrective actions.

```bash
Rscript -e 'print(read.csv("output/problem_actions.csv"))'
```

Record what you observed before continuing.
### Step 6 — Record the metric definition, data source, owner and next review date in CHECKLIST.md.

```bash
open CHECKLIST.md
```

Record what you observed before continuing.

## Evidence to retain

- [ ] output/dora_metrics.csv
- [ ] output/problem_actions.csv
- [ ] output/dora_dashboard.png
- [ ] completed CHECKLIST.md

## Acceptance criteria

- Five current DORA metrics
- Definitions and denominators explicit
- Open actions tracked
- Improvement hypothesis avoids individual ranking

## Verification

Five DORA measures are present; the deployment counts reconcile; every open action has an owner and due date; dashboard values match the CSV.

## Troubleshooting

- `cannot open file`: confirm your terminal is in this lab folder.
- `Rscript: command not found`: install R, reopen the terminal and run `Rscript --version`.
- A validation `stop(...)` message is evidence that the input broke a stated rule; inspect the named field rather than bypassing the check.
- If an output looks wrong, compare row counts and IDs with the source CSV before changing the analysis.

## Clean rerun

Delete only the files inside `output/`, then run the R script again. The source CSV and script remain unchanged.
