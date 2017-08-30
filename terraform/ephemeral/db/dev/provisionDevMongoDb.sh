#!/usr/bin/env bash

echo "Provisioning Mongo DB in Dev"

ORG_DIR=$PWD
THIS_DIR=`dirname $0`
echo "Dir: ${THIS_DIR}"
cd ${THIS_DIR}

if [[ ${MONGODB_ATLAS_TOKEN} == "" ]]; then
    echo "ERROR: Environment variable MONGODB_ATLAS_TOKEN needs to be set"
    exit 1
fi

if [[ ${MONGODB_ATLAS_GROUP} == "" ]]; then
    echo "ERROR: Environment variable MONGODB_ATLAS_GROUP needs to be set"
    exit 1
fi

echo "Let's create the Mongo DB Cluster"

curl -X POST -H "Content-Type: application/json" \
 -d @mongoDbConfig.json \
 -u "andy@sudostream.io:${MONGODB_ATLAS_TOKEN}" --digest \
 "https://cloud.mongodb.com/api/atlas/v1.0/groups/${MONGODB_ATLAS_GROUP}/clusters"

if [ $? -ne 0 ]; then
    echo
    echo "ERROR: Attempting to create the Mongo DB Cluster failed. Please check the output above."
    exit 1
fi

echo
echo "Finished requesting provisioning of Mongo DB Cluster"

cd ${ORG_DIR}
