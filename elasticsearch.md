Increase number of initializing shards per node, defaults to 2
`curl ip:9200/_cluster/settings -d '{"transient":{"cluster.routing.allocation.node_concurrent_recoveries":"30"}}' -XPUT -H 'Content-Type: application/json'`
