dir.create("output",showWarnings=FALSE)
d <- read.csv("data/service_risk.csv",stringsAsFactors=FALSE)
d$allowed_unreliable_pct <- 100-d$slo_pct
d$observed_unreliable_pct <- 100-d$observed_reliability_pct
d$error_budget_consumed_pct <- round(100*d$observed_unreliable_pct/d$allowed_unreliable_pct,1)
d$security_risk <- d$critical_findings*5+d$high_findings*3+d$medium_findings
d$policy <- ifelse(d$error_budget_consumed_pct>100 | d$critical_findings>0,"BLOCK",
                   ifelse(d$error_budget_consumed_pct>75 | d$security_risk>=8,"APPROVAL","AUTOMATE"))
write.csv(d,"output/guardrail_decisions.csv",row.names=FALSE)
png("output/error_budget.png",1100,700)
barplot(d$error_budget_consumed_pct,names.arg=d$service,col=ifelse(d$policy=="BLOCK","#DC2626",ifelse(d$policy=="APPROVAL","#F59E0B","#10B981")),ylab="Error budget consumed (%)",main="Reliability budget and delivery policy")
abline(h=100,lty=2)
dev.off()
stopifnot(all(c("BLOCK","APPROVAL","AUTOMATE") %in% d$policy))
cat("LAB 06 PASS\n")
