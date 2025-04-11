#!/usr/bin/env bash

region2="us-west-1"
region1="us-east-1"


packer init ./packer/

packer fmt ./packer/

if ! packer validate -var "region1=$region1" -var "region2=$region2" ./packer/ami.pkr.hcl; then
    echo "Packer validate failed."
    exit 1
fi

if packer build -var "region1=$region1" -var "region2=$region2" ./packer/ami.pkr.hcl; then
    echo "Packer build successful."
else
    echo "Packer build failed."
    exit 1
fi