# Lab 01 — Build an Incident-to-Problem Lifecycle Baseline in R

Course: DevOps Foundation Training (TGS-2024049184)
Version: v4.0
Topic: 01
Estimated time: 35–45 minutes

## Workplace scenario

Northstar Retail has recurring checkout incidents but no shared view of where work stalls. You are asked to build a reproducible lifecycle baseline before proposing automation.

## Objective

Apply K1 and A1 by managing a supplied incident dataset through detection, logging, investigation, resolution and learning states.

## What you will produce

A clean lifecycle_summary.csv, ageing_problems.csv and lifecycle_status.png backed by a repeatable R script.

## Prerequisites

- R 4.x available as `Rscript`.
- Work from this lab folder so relative paths resolve.
- Use only the supplied synthetic data; no internet connection or external package is required.
- Preserve the source data. Make experimental changes in a copied file, then restore it.

## Folder map

```text
Lab-01-incident-lifecycle-baseline/
├── README.md / README.pdf
├── CHECKLIST.md / CHECKLIST.pdf
├── incident_lifecycle_baseline.R
├── data/
└── output/            # reproducible evidence produced by the R script
```

## Detailed procedure

### Step 1 — Open a terminal in the Lab-01 folder and confirm R is available.

```bash
Rscript --version
```

Record what you observed before continuing.
### Step 2 — Inspect data/incidents.csv and identify the required identity, impact, ownership and timestamp fields.

```bash
Rscript -e 'd <- read.csv("data/incidents.csv"); str(d); print(d)'
```

Record what you observed before continuing.
### Step 3 — Run the supplied analysis script; it validates statuses and dates before calculating hours to restore and days open.

```bash
Rscript incident_lifecycle.R
```

Record what you observed before continuing.
### Step 4 — Review output/lifecycle_summary.csv and explain where the lifecycle is accumulating delay.

```bash
Rscript -e 'print(read.csv("output/lifecycle_summary.csv"))'
```

Record what you observed before continuing.
### Step 5 — Review output/ageing_problems.csv and choose one record for further investigation.

```bash
Rscript -e 'print(read.csv("output/ageing_problems.csv"))'
```

Record what you observed before continuing.
### Step 6 — Open output/lifecycle_status.png and record two evidence-based observations in CHECKLIST.md.

```bash
open output/lifecycle_status.png
```

Record what you observed before continuing.

## Evidence to retain

- [ ] output/lifecycle_summary.csv
- [ ] output/ageing_problems.csv
- [ ] output/lifecycle_status.png
- [ ] completed CHECKLIST.md

## Acceptance criteria

- No invalid status or negative duration
- Status total equals eight source records
- At least one ageing problem is identified
- Two observations cite values from the outputs

## Verification

The script exits with 'LAB 01 PASS'; all eight records are represented; open problems are ranked by ageing days; status totals reconcile to the source rows.

## Troubleshooting

- `cannot open file`: confirm your terminal is in this lab folder.
- `Rscript: command not found`: install R, reopen the terminal and run `Rscript --version`.
- A validation `stop(...)` message is evidence that the input broke a stated rule; inspect the named field rather than bypassing the check.
- If an output looks wrong, compare row counts and IDs with the source CSV before changing the analysis.

## Clean rerun

Delete only the files inside `output/`, then run the R script again. The source CSV and script remain unchanged.
