#!/usr/bin/env bash

ORG_DIR=$PWD
THIS_DIR=`dirname $0`
echo "Dir: ${THIS_DIR}"
cd ${THIS_DIR}

export IAC_EPHEMERAL_DIR=${HOME}/iac/ephemeral

export DEV_DNS_NAME_SERVERS=`terraform output -state=${IAC_ENDURING_DIR}/terraform.tfstate dev_name_servers`
export DEV_DNS_NAME=`terraform output -state=${IAC_ENDURING_DIR}/terraform.tfstate dev_dns_name`
export DEV_DNS_ZONE_NAME=`terraform output -state=${IAC_ENDURING_DIR}/terraform.tfstate dev_dns_zone_name`


terraform destroy -force -state=${IAC_EPHEMERAL_DIR}/terraform.tfstate -var 'dev_dns_name=${DEV_DNS_NAME}' -var 'dev_dns_zone_name=${DEV_DNS_ZONE_NAME}'

# TODO: Paramerise this later, i.e. dev, test, prod
./db/dev/deleteDevMongoDb.sh

cd ${ORG_DIR}
