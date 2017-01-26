#!/usr/bin/env bash

mkdir -p ${HOME}/iac

terraform apply -state=${HOME}/iac/terraform.tfstate

