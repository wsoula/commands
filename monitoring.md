KPI
---
* error rate - percent of errors (in log or 4xx/5xx from cw)
* availability yield - percent of well formed requests that succeeded
* availability harvest - data in request / total data

Four Golden Signals
---
* Latency
* Traffic
* Errors
* Saturation

High Level Requirements
---
1) monitoring of all resources in path of request ("there is a problem and it doesn't look like code")
  * aws managed resource monitoring
  * host monitoring at fleet level
  * host monitoring at host level
2) alerting on errors in logs, or metrics made from logs
3) tracing for path of request through services in a nice visual format and correlate trace to log messages
4) dashboards
5) endpoint monitoring of starz app, but possibly also third parties
6) robust api for 3rd party integrations and getting data out for retention
