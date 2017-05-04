#!/bin/bash
mkdir -p ~/pkg ~/keys
if [[ $DOCKER_IMAGE == *"rpm"* || $DOCKER_IMAGE == *"sles"* ]]
then
  echo -e $RPM_GPG_KEY > /home/ubuntu/keys/RPM-SIGNING-KEY.private
fi
