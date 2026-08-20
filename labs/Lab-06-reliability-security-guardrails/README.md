# Lab 06 — Balance Reliability, Security and Delivery Guardrails

Course: DevOps Foundation Training (TGS-2024049184)
Version: v4.0
Topic: 06
Estimated time: 35–45 minutes

## Workplace scenario

A team wants faster deployment, while operations and security want more approval gates. You must use risk and error-budget evidence to design a faster but controlled path.

## Objective

Apply K4 and A4 by categorising reliability and security risks, then selecting proportional automated guardrails.

## What you will produce

A guardrail_decisions.csv, error_budget.png and documented trade-off decision.

## Prerequisites

- R 4.x available as `Rscript`.
- Work from this lab folder so relative paths resolve.
- Use only the supplied synthetic data; no internet connection or external package is required.
- Preserve the source data. Make experimental changes in a copied file, then restore it.

## Folder map

```text
Lab-06-reliability-security-guardrails/
├── README.md / README.pdf
├── CHECKLIST.md / CHECKLIST.pdf
├── reliability_security_guardrails.R
├── data/
└── output/            # reproducible evidence produced by the R script
```

## Detailed procedure

### Step 1 — Inspect service_risk.csv and review the SLO, observed reliability and security finding fields.

```bash
Rscript -e 'print(read.csv("data/service_risk.csv"))'
```

Record what you observed before continuing.
### Step 2 — Run resilience_security.R to calculate error-budget consumption and security risk score.

```bash
Rscript resilience_security.R
```

Record what you observed before continuing.
### Step 3 — Review guardrail_decisions.csv and explain why different services receive warn, approve or block treatment.

```bash
Rscript -e 'print(read.csv("output/guardrail_decisions.csv"))'
```

Record what you observed before continuing.
### Step 4 — Open error_budget.png and identify the service consuming more than its available budget.

```bash
open output/error_budget.png
```

Record what you observed before continuing.
### Step 5 — Propose one preventive, one detective and one recovery control for the highest-risk service.

```bash
open CHECKLIST.md
```

Record what you observed before continuing.
### Step 6 — Record the control owner, evidence source and safe rollback method.

```bash
open CHECKLIST.md
```

Record what you observed before continuing.

## Evidence to retain

- [ ] output/guardrail_decisions.csv
- [ ] output/error_budget.png
- [ ] completed CHECKLIST.md

## Acceptance criteria

- Error budget formula correct
- Three distinct proportional policies
- Prevent/detect/recover controls
- Rollback and owner recorded

## Verification

All policies are derived from published thresholds; at least one service is blocked, one warns and one proceeds automatically.

## Troubleshooting

- `cannot open file`: confirm your terminal is in this lab folder.
- `Rscript: command not found`: install R, reopen the terminal and run `Rscript --version`.
- A validation `stop(...)` message is evidence that the input broke a stated rule; inspect the named field rather than bypassing the check.
- If an output looks wrong, compare row counts and IDs with the source CSV before changing the analysis.

## Clean rerun

Delete only the files inside `output/`, then run the R script again. The source CSV and script remain unchanged.
