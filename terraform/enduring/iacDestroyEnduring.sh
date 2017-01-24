#!/usr/bin/env bash

export IAC_ENDURING_DIR=${HOME}/iac/enduring
mkdir -p ${IAC_ENDURING_DIR}

terraform destroy -force -state=${IAC_ENDURING_DIR}/terraform.tfstate

