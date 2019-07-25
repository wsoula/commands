Increase number of initializing shards per node, defaults to 2
`curl ip:9200/_cluster/settings -d '{"transient":{"cluster.routing.allocation.node_concurrent_recoveries":"30"}}' -XPUT -H 'Content-Type: application/json'`

Delete all indices
```
for i in `curl '<ip>:9200/_cat/indices?v' | tail -n +2 | awk '{print $3}'`
do
curl -XDELETE "http://<ip>:9200/$i"
done
```
