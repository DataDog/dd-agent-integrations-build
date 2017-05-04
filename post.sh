#!/bin/bash

if [[ $DOCKER_IMAGE == *"sles"* ]];
then
  docker login -e $QUAY_EMAIL -u $QUAY_USERNAME -p $QUAY_PASSWORD quay.io
  docker run -e INTEGRATIONS_REPO=$INTEGRATIONS_REPO -e INTEGRATION=$INTEGRATION -e VERSION=$VERSION -e BUILD_ITERATION=$BUILD_ITERATION  -e RPM_SIGNING_PASSPHRASE=$RPM_SIGNING_PASSPHRASE -e OMNIBUS_BRANCH=$OMNIBUS_BRANCH -e OMNIBUS_RUBY_BRANCH=$OMNIBUS_RUBY_BRANCH -v /home/ubuntu/keys:/keys -v /home/ubuntu/pkg:/dd-agent-omnibus/pkg --entrypoint bin/bash $DOCKER_IMAGE:latest -l /dd-agent-omnibus/build_integration.sh
elif [[ $DOCKER_IMAGE == *"rpm"* ]]
then
  docker run -e INTEGRATIONS_REPO=$INTEGRATIONS_REPO -e INTEGRATION=$INTEGRATION -e VERSION=$VERSION -e BUILD_ITERATION=$BUILD_ITERATION  -e RPM_SIGNING_PASSPHRASE=$RPM_SIGNING_PASSPHRASE -e OMNIBUS_BRANCH=$OMNIBUS_BRANCH -e OMNIBUS_RUBY_BRANCH=$OMNIBUS_RUBY_BRANCH -v /home/ubuntu/keys:/keys -v /home/ubuntu/pkg:/dd-agent-omnibus/pkg --entrypoint bin/bash $DOCKER_IMAGE:latest -l /dd-agent-omnibus/build_integration.sh
else
  docker run -e INTEGRATIONS_REPO=$INTEGRATIONS_REPO -e INTEGRATION=$INTEGRATION -e VERSION=$VERSION -e BUILD_ITERATION=$BUILD_ITERATION -e OMNIBUS_BRANCH=$OMNIBUS_BRANCH -e OMNIBUS_RUBY_BRANCH=$OMNIBUS_RUBY_BRANCH -v /home/ubuntu/pkg:/dd-agent-omnibus/pkg --entrypoint bin/bash $DOCKER_IMAGE:latest -l /dd-agent-omnibus/build_integration.sh
fi
