# Lab 02 — Detect Actionable Service Signals in R

Course: DevOps Foundation Training (TGS-2024049184)
Version: v4.0
Topic: 02
Estimated time: 35–45 minutes

## Workplace scenario

Checkout latency has intermittent spikes. The operations channel receives too many generic alerts, so the team needs an evidence-based detection rule and clear routing fields.

## Objective

Apply K2 and A2 by designing an automated detection rule that produces specific, severity-ranked problem signals without excessive noise.

## What you will produce

A detected_alerts.csv with severity, evidence and action plus a telemetry_detection.png chart.

## Prerequisites

- R 4.x available as `Rscript`.
- Work from this lab folder so relative paths resolve.
- Use only the supplied synthetic data; no internet connection or external package is required.
- Preserve the source data. Make experimental changes in a copied file, then restore it.

## Folder map

```text
Lab-02-automated-signal-detection/
├── README.md / README.pdf
├── CHECKLIST.md / CHECKLIST.pdf
├── automated_signal_detection.R
├── data/
└── output/            # reproducible evidence produced by the R script
```

## Detailed procedure

### Step 1 — Review the telemetry sample and identify the service-level indicators represented by each column.

```bash
Rscript -e 'd <- read.csv("data/telemetry.csv"); summary(d)'
```

Record what you observed before continuing.
### Step 2 — Run automated_detection.R to calculate a rolling baseline and flag only sustained abnormal windows.

```bash
Rscript automated_detection.R
```

Record what you observed before continuing.
### Step 3 — Inspect detected_alerts.csv; confirm every alert names the service, signal, severity, evidence and immediate action.

```bash
Rscript -e 'print(read.csv("output/detected_alerts.csv"))'
```

Record what you observed before continuing.
### Step 4 — Open the detection chart and compare the threshold with the observed latency series.

```bash
open output/telemetry_detection.png
```

Record what you observed before continuing.
### Step 5 — Change min_consecutive from 2 to 1, rerun, and compare the alert count to demonstrate alert-fatigue risk; then restore it to 2.

```bash
Rscript automated_detection.R
```

Record what you observed before continuing.
### Step 6 — Complete CHECKLIST.md with the chosen rule, trade-off and escalation owner.

```bash
open CHECKLIST.md
```

Record what you observed before continuing.

## Evidence to retain

- [ ] output/detected_alerts.csv
- [ ] output/telemetry_detection.png
- [ ] completed CHECKLIST.md

## Acceptance criteria

- Two sustained alert windows
- No alert for isolated row 7 spike
- Every alert has severity, owner and action
- Learner explains sensitivity versus noise

## Verification

The final rule emits exactly two sustained alert windows, no single-point spike alert, and every alert has a non-empty owner and action.

## Troubleshooting

- `cannot open file`: confirm your terminal is in this lab folder.
- `Rscript: command not found`: install R, reopen the terminal and run `Rscript --version`.
- A validation `stop(...)` message is evidence that the input broke a stated rule; inspect the named field rather than bypassing the check.
- If an output looks wrong, compare row counts and IDs with the source CSV before changing the analysis.

## Clean rerun

Delete only the files inside `output/`, then run the R script again. The source CSV and script remain unchanged.
