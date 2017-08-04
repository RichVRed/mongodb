#!/bin/bash

mkdir -p /data/db
mkdir -p /data/logs

if [ -f "/data/mongod.conf" ];
then
   echo "using /data/mongod.conf for MongoDB config!"
else
   cp /mongod.conf /data/mongod.conf
fi

mongod -f /data/mongod.conf

