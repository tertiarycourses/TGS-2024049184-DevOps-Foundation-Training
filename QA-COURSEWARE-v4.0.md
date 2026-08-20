# DevOps Foundation Training v4.0 — Courseware QA

**Course code:** TGS-2024049184
**Audit date:** 21 August 2026
**Overall courseware verdict:** PASS

## A. PowerPoint quality — PASS

- 124 widescreen slides rendered and visually reviewed page by page.
- Cover carries one version label (`v4.0`) and an AI-generated, text-free DevOps hero with editable title space.
- General trainer template and named Dr Alfred Ang profile are separate visual pages, as required by the house checklist.
- Visual LMS download flow, WA-to-Case-Study assessment flow, digital-attendance pages and closing administration pages are present.
- Seven editable native PowerPoint charts are embedded; no chart is a screenshot.
- No shapes fall outside the slide boundary, no broken media was found, and no non-footer run is below 12 pt.
- No numbered lab procedure or R command sequence appears in the deck.
- Certification-readiness content uses the official guide and current exam context. No unrelated Tertiary practice exam is presented because no matching DevOps Foundation bank was found.

### Visual repair cycle

The first independent render found inherited AI/Python troubleshooting on eight lab evidence-check slides, small table/process text, a shortened LMS address and two sparse pages. The source builder was corrected and all 124 slides were regenerated. The second independent render confirmed the stale content was removed, the full LMS address was legible, the sparse pages became visual tiles, lab evidence models became course-specific, and no new overflow was introduced.

## B. Assessment quality — PASS

- Original controlled structure preserved: 5 WA-SAQ questions, 3 Case Study tasks, 60 minutes per instrument.
- Instrument type remains Case Study; all questions and tasks are open-ended.
- Candidate papers render with cover-only page 1, candidate information/instructions/grading on page 2, and assessment content from page 3.
- All four rendered documents passed `verify_assessment.py`; no obsolete `For Official Use Only` block is present.
- Answer keys repeat the codes and provide suggestive answers with source slide/lab references.

| Criterion | Assessment item | Taught in | Practised in |
|---|---|---|---|
| K1 | WA Question 1 | Topics 01–02 | Lab 01 |
| K2 | WA Question 2 | Topics 02–03 | Labs 02–03 |
| K3 | WA Question 3 | Topic 04 | Labs 03–04 |
| K4 | WA Question 4 | Topics 05–06 | Labs 04–06 |
| K5 | WA Question 5 | Topics 07–08 | Labs 07–08 |
| A1, A2 | CS Task 1 | Topics 01–03 | Labs 01–02 and 08 |
| A3, A4 | CS Task 2 | Topics 04–06 | Labs 03–06 and 08 |
| A5, A6 | CS Task 3 | Topics 07–08 | Labs 07–08 |

## C. Lesson Plan — PASS

- WSQ cover, version-control record, populated page-numbered contents, slide ranges, lab mapping and assessment traceability are present.
- Day 1 and Day 2 each total 480 minutes excluding lunch; the package totals 14 delivery hours plus 2 assessment hours.
- Slide ranges were regenerated from the final 124-slide map.

## D. Learner Guide — PASS

- WSQ cover, version-control record, populated page-numbered contents, footer and Markdown mirror are present.
- Detailed procedures, R commands, verification checkpoints, evidence lists, acceptance criteria and troubleshooting are included for all eight labs.
- A repair cycle corrected Word's carried-over list numbering; every lab now visibly starts at step 1.

## E. Labs and alignment — PASS

- Eight self-contained lab folders; each contains one base-R script, synthetic data, learner README/checklist, same-basename Markdown/PDF resources and generated evidence.
- All eight scripts executed successfully and emitted `LAB NN PASS`.
- Markdown/PDF parity: 18 Markdown files and 18 same-basename PDFs.
- Deck, Learner Guide, Lesson Plan and assessments use the same lab titles, evidence model and K/A mapping.

## F. Files, versions and release boundary — PASS

- One live courseware version: v4.0.
- PPTX/PDF, LG DOCX/PDF and LP DOCX/PDF are present.
- `.env`, `assessment/`, `reference/`, build tooling, generated cover assets and QA renders are excluded from the public GitHub boundary.
- Candidate assessment papers are learner-facing on Drive; answer keys are trainer-only and excluded from LMS and GitHub.

## Command equivalence disclosure

The installed slash-command text was implemented through its project-local generators, rendered QA tools and publication scripts. The user typo `/assessemnt-gen` was fulfilled with the installed assessment-generation workflow. The pre-Drive LMS dry run correctly failed on missing current LG/LP PDFs and was not counted as a pass; the final TMS preflight is run only after current Drive artifacts and permissions are verified.

## Publication verification — PASS with one legacy archive exception

- Local and Drive MD5 values match for the final PPTX/PDF, LG DOCX/PDF and LP DOCX/PDF.
- Drive contains eight individual lab folders and 74 current activity files, excluding the archive.
- Anonymous readback returns document bytes for the WA and Case Study candidate papers and an account sign-in barrier for both answer keys.
- LMS-TMS readback confirms all seven learner-facing links. Semantic before/after verification confirms intended links and nested assessment methods match while non-target fields are unchanged.
- Legacy exception: `WSQ - Learner Guide Slides - DevOps Foundation Training - v3.pdf` remains in the live Learner Guide folder because Drive returns `403 insufficientFilePermissions` when the current account attempts to archive it. The final LMS resolver explicitly selects `DevOps Foundation Training-v4.0.pdf`, and archived v3 copies remain available. Owner intervention is required to remove the live legacy file.
