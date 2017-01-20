#!/usr/bin/env bash

#gcloud docker login -e 1234@5678.com -u _json_key -p "$(cat /home/andy/.secrets/api-event-horizon-33d2211db244.json)" https://gcr.io
terraform apply -state=${HOME}/iac/terraform.tfstate

