type=$1
export NOMAD_ADDR=http://<ip>:4646
nomad node status | grep "$type " | awk '{print $1}' > tmp
while read id; do
  #nomad node status -stats $id | grep -A 2 "Allocated Resources"
  allocation=$(nomad node status -stats $id | grep -m 1 "GiB/" | awk '{print $3 $4 $5}')
  name=$(nomad node status $id | grep -m 1 "Name" | awk '{print $3}')
  echo "$allocation | $name | $id"
done < tmp
