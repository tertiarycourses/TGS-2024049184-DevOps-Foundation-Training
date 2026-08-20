# Problem Record — Northstar Checkout

## Lifecycle status
Investigating — evidence synthesis completed; corrective actions proposed.

## Impact
3 repeat incidents; peak latency 880 ms; 695 affected orders.

## Evidence
- 3 incidents reference valid change records.
- Peak latency followed change CHG-34.
- Dependency version drift is a supported contributor; sole root cause remains a hypothesis pending controlled reproduction.

## Recommendations
- Prevent: Pin and verify dependency versions before merge — Platform team; verify: Zero unpinned production dependencies
- Detect: Alert on sustained latency plus change correlation — SRE team; verify: Two consecutive windows; false positive below 5%
- Recover: Automate safe rollback when canary SLO is breached — Checkout team; verify: Recovery below 30 minutes in game day

## Review
Review on 2026-09-20 using repeat-incident count, false-positive rate and recovery time.
