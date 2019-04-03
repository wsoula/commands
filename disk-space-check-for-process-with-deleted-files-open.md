Check for deleted files that are still held open
---
* `sudo lsof -nP +L1 | grep deleted`

Has how to truncate these files and is where I got the above command:
https://unix.stackexchange.com/questions/68523/find-and-remove-large-files-that-are-open-but-have-been-deleted
