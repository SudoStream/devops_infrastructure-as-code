#!/bin/bash

mongoDbIsNotRunning=1

while [ $mongoDbIsNotRunning -gt 0 ]
do
  echo "Mongo Db not yet running..."

  mongo "mongodb://timetoteachdevmongodb-shard-00-00-sss8y.gcp.mongodb.net:27017,timetoteachdevmongodb-shard-00-01-sss8y.gcp.mongodb.net:27017,timetoteachdevmongodb-shard-00-02-sss8y.gcp.mongodb.net:27017/test?replicaSet=TimeToTeachDevMongoDB-shard-0" --authenticationDatabase admin --ssl --username ttt --password hello321 <<EOF
show dbs
quit()
EOF

  mongoDbIsNotRunning=$?

  sleep 5
done

echo "Mongo Db now up!"

