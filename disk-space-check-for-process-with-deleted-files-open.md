Check for deleted files that are still held open
---
* `sudo lsof -nP +L1 | grep deleted`
