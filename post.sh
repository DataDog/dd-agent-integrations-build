#!/bin/bash

if [[ $DOCKER_IMAGE == *"i386"* ]]
then
    ENTRYPOINT=linux32
    COMMAND=bin/bash
else
    ENTRYPOINT=bin/bash
    COMMAND=
fi

if [[ $DOCKER_IMAGE == *"rpm"* ]]
then
  docker run -e INTEGRATION=$INTEGRATION -e VERSION=$VERSION -e RPM_SIGNING_PASSPHRASE=$RPM_SIGNING_PASSPHRASE -e OMNIBUS_BRANCH=$OMNIBUS_BRANCH -e OMNIBUS_RUBY_BRANCH=$OMNIBUS_RUBY_BRANCH -v /home/ubuntu/keys:/keys -v /home/ubuntu/pkg:/dd-agent-omnibus/pkg -v /home/ubuntu/cache:/var/cache/omnibus --entrypoint $ENTRYPOINT $DOCKER_IMAGE:sdk $COMMAND -l /dd-agent-omnibus/build_integration.sh
else
  docker run -e INTEGRATION=$INTEGRATION -e VERSION=$VERSION -e OMNIBUS_BRANCH=$OMNIBUS_BRANCH -e OMNIBUS_RUBY_BRANCH=$OMNIBUS_RUBY_BRANCH -e CORE_INTEGRATIONS_BRANCH=$CORE_INTEGRATIONS_BRANCH -v /home/ubuntu/pkg:/dd-agent-omnibus/pkg -v /home/ubuntu/cache:/var/cache/omnibus --entrypoint $ENTRYPOINT $DOCKER_IMAGE:sdk $COMMAND -l /dd-agent-omnibus/build_integration.sh
fi
