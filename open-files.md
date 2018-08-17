See what has all the files open
Error is too many open files
`lsof | awk '{ print $2 " " $1; }' | sort -rn | uniq -c | sort -rn | head -20`
