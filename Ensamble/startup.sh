#!/bin/bash

set -e

if [ ! ${nopull} ] ; then
  echo 'Pulling all images needed, just to be sure'
  docker pull busybox
  docker pull wouterd/zookeeper
  
fi

# Need a volume to read the config from
conf_container=zoo1

# Start the zookeeper containers
for i in {1..5} ; do
  if [ "${i}" == "1" ] ; then
    docker run -d -v /zoo/conf -p 2181:2181 --name "zoo${i}" -e ZOO_ID=${i} wouterd/zookeeper
  else
    docker run -d --volumes-from ${conf_container} --name "zoo${i}" -e ZOO_ID=${i} wouterd/zookeeper
  fi
done

config=$(cat zoo.cfg.initial)

# Look up the zookeeper instance IPs and create the config file (pssible to use --link here, but whatever.
for i in {1..5} ; do
  container_name=zoo${i}
  container_ip=$(docker inspect --format '{{.NetworkSettings.IPAddress}}' ${container_name})
  line="server.${i}=${container_ip}:2888:3888"
  config="${config}"$'\n'"${line}"
done

# Write the config to the config container
echo "${config}" | docker run -i --rm --volumes-from ${conf_container} busybox sh -c 'cat > /zoo/conf/zoo.cfg'

