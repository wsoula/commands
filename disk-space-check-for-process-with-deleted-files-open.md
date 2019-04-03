Check for deleted files that are still held open
---
* `sudo lsof -nP +L1 | grep deleted`

Truncate them
---
* `> /proc/<process id from above>/fd/<fd from above with no letter after it>`
* example run as root
  * `ls -hal /proc/16900/fd/3` to verify it is the right file
  * `> /proc/16900/fd/3` to set to 0 bytes

Has how to truncate these files and is where I got the above command:
https://unix.stackexchange.com/questions/68523/find-and-remove-large-files-that-are-open-but-have-been-deleted
