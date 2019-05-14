DNS lookup
---
for i in $(seq 1 1000); do dig URL | grep "Query time: [0-9][0-9]\\+"; done;

Curl
---
for i in $(seq 1 100); do { time curl 'URL' -H 'HEADER: REDACTED' -s; } |& grep -oe "[0-9]\\+[0-9].[0-9]\\+ total"; done;

