for i in $(dig +noall +short app-a-in.drillinginfo.com | grep ^10 | sort); do echo -n "$i: ";  curl --max-time 3 -sv http://${i}/webstats/piwik.js 2>&1 >/dev/null | grep 'Connect\|Operation'; done
