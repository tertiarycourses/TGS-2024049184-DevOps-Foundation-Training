dir.create("output", showWarnings = FALSE)
d <- read.csv("data/telemetry.csv", stringsAsFactors=FALSE)
d$timestamp <- as.POSIXct(d$timestamp, tz="UTC")
baseline <- median(d$latency_ms[1:6])
spread <- mad(d$latency_ms[1:6], constant=1.4826)
d$robust_z <- round((d$latency_ms-baseline)/spread, 2)
d$breach <- d$robust_z >= 3 | d$error_rate_pct >= 3
min_consecutive <- 2
run_id <- cumsum(c(TRUE, diff(d$breach)!=0))
runs <- split(seq_len(nrow(d)), run_id)
alert_rows <- integer()
for (idx in runs) if (all(d$breach[idx]) && length(idx)>=min_consecutive) alert_rows <- c(alert_rows, idx[1])
alerts <- d[alert_rows, c("timestamp","service","latency_ms","error_rate_pct","robust_z")]
alerts$severity <- ifelse(alerts$error_rate_pct>=5, "SEV-1", "SEV-2")
alerts$owner <- "Checkout on-call"
alerts$action <- "Open problem record; inspect deployment and dependency timeline"
write.csv(alerts, "output/detected_alerts.csv", row.names=FALSE)
png("output/telemetry_detection.png", 1200, 700)
plot(d$timestamp, d$latency_ms, type="o", pch=19, col=ifelse(d$breach,"#F59E0B","#1F6FEB"), xlab="UTC time", ylab="Latency (ms)", main="Checkout telemetry and automated detection")
abline(h=baseline+3*spread, col="#DC2626", lty=2)
dev.off()
stopifnot(nrow(alerts)==2, all(nzchar(alerts$owner)), all(nzchar(alerts$action)))
cat("LAB 02 PASS\n")
