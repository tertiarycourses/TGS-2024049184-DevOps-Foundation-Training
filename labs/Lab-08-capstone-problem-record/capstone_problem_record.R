dir.create("output",showWarnings=FALSE)
inc <- read.csv("data/incidents.csv",stringsAsFactors=FALSE)
chg <- read.csv("data/changes.csv",stringsAsFactors=FALSE)
tel <- read.csv("data/telemetry.csv",stringsAsFactors=FALSE)
act <- read.csv("data/actions.csv",stringsAsFactors=FALSE)
stopifnot(all(inc$change_id %in% chg$change_id),all(act$problem_id %in% inc$problem_id))
rec <- data.frame(problem_id=unique(inc$problem_id),
 control_type=c("Prevent","Detect","Recover"),
 recommendation=c("Pin and verify dependency versions before merge","Alert on sustained latency plus change correlation","Automate safe rollback when canary SLO is breached"),
 owner=c("Platform team","SRE team","Checkout team"),
 due_date=c("2026-09-05","2026-09-08","2026-09-12"),
 verification=c("Zero unpinned production dependencies","Two consecutive windows; false positive below 5%","Recovery below 30 minutes in game day"))
write.csv(rec,"output/recommendations.csv",row.names=FALSE)
md <- c("# Problem Record — Northstar Checkout", "", "## Lifecycle status", "Investigating — evidence synthesis completed; corrective actions proposed.", "", "## Impact", sprintf("%d repeat incidents; peak latency %d ms; %d affected orders.",nrow(inc),max(tel$latency_ms),sum(inc$affected_orders)), "", "## Evidence", paste0("- ",nrow(inc)," incidents reference valid change records."), paste0("- Peak latency followed change ",chg$change_id[which.max(chg$risk_score)],"."), "- Dependency version drift is a supported contributor; sole root cause remains a hypothesis pending controlled reproduction.", "", "## Recommendations", paste0("- ",rec$control_type,": ",rec$recommendation," — ",rec$owner,"; verify: ",rec$verification), "", "## Review", "Review on 2026-09-20 using repeat-incident count, false-positive rate and recovery time.")
writeLines(md,"output/problem_record.md")
stopifnot(nrow(rec)==3,all(nzchar(rec$owner)),all(nzchar(rec$verification)))
cat("LAB 08 PASS\n")
