#!/bin/bash
mkdir -p ~/pkg ~/cache ~/keys ~/cache/$DOCKER_IMAGE
if [[ $DOCKER_IMAGE == *"rpm"* ]]
then
  echo -e $RPM_GPG_KEY > /home/ubuntu/keys/RPM-SIGNING-KEY.private
fi
