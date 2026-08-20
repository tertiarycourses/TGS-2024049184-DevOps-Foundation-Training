# Lab 08 — Capstone — Produce a Verified DevOps Problem Recommendation

Course: DevOps Foundation Training (TGS-2024049184)
Version: v4.0
Topic: 08
Estimated time: 35–45 minutes

## Workplace scenario

Northstar Retail's checkout service has repeat latency failures after dependency changes. You are the cross-functional problem lead preparing a decision-ready problem record for leadership.

## Objective

Apply A1–A6 in one connected case: manage the lifecycle, analyse root cause, prioritise, recommend controls and create monitorable documentation.

## What you will produce

A problem_record.md and recommendations.csv that can be audited from detection through verification.

## Prerequisites

- R 4.x available as `Rscript`.
- Work from this lab folder so relative paths resolve.
- Use only the supplied synthetic data; no internet connection or external package is required.
- Preserve the source data. Make experimental changes in a copied file, then restore it.

## Folder map

```text
Lab-08-capstone-problem-record/
├── README.md / README.pdf
├── CHECKLIST.md / CHECKLIST.pdf
├── capstone_problem_record.R
├── data/
└── output/            # reproducible evidence produced by the R script
```

## Detailed procedure

### Step 1 — Review all four capstone datasets and write an initial problem statement that separates impact from assumed cause.

```bash
Rscript -e 'for(f in list.files("data",full.names=TRUE)) {cat("\n",f,"\n"); print(read.csv(f))}'
```

Record what you observed before continuing.
### Step 2 — Run capstone_problem_record.R to validate referential integrity and generate the first evidence synthesis.

```bash
Rscript capstone_problem_record.R
```

Record what you observed before continuing.
### Step 3 — Open recommendations.csv and refine each action so it names control type, owner, due date, metric and verification threshold.

```bash
open output/recommendations.csv
```

Record what you observed before continuing.
### Step 4 — Open problem_record.md and complete the root-cause and contributing-conditions narrative using only supported evidence.

```bash
open output/problem_record.md
```

Record what you observed before continuing.
### Step 5 — Use the acceptance checklist to test K/A traceability, lifecycle status and recurrence-prevention logic.

```bash
open CHECKLIST.md
```

Record what you observed before continuing.
### Step 6 — Present a three-minute recommendation: problem, evidence, selected controls, trade-off and how success will be verified.

```bash
open output/problem_record.md
```

Record what you observed before continuing.

## Evidence to retain

- [ ] output/problem_record.md
- [ ] output/recommendations.csv
- [ ] completed CHECKLIST.md
- [ ] three-minute briefing

## Acceptance criteria

- A1–A6 traceability complete
- Cause versus hypothesis distinguished
- At least three proportional controls
- Each action has owner, due date and verification threshold

## Verification

All referenced IDs reconcile; the record covers detection through learning; three recommendations include owner, due date and verification; unsupported causal claims are labelled as hypotheses.

## Troubleshooting

- `cannot open file`: confirm your terminal is in this lab folder.
- `Rscript: command not found`: install R, reopen the terminal and run `Rscript --version`.
- A validation `stop(...)` message is evidence that the input broke a stated rule; inspect the named field rather than bypassing the check.
- If an output looks wrong, compare row counts and IDs with the source CSV before changing the analysis.

## Clean rerun

Delete only the files inside `output/`, then run the R script again. The source CSV and script remain unchanged.
