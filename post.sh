#!/bin/bash
if [[ $DOCKER_IMAGE == *"rpm"* ]]
then
  docker run -e RPM_SIGNING_PASSPHRASE=$RPM_SIGNING_PASSPHRASE -e OMNIBUS_SOFTWARE_BRANCH=$OMNIBUS_SOFTWARE_BRANCH -e OMNIBUS_BRANCH=$OMNIBUS_BRANCH -e AGENT_BRANCH=$AGENT_BRANCH -e AGENT_VERSION=$AGENT_VERSION -v /home/ubuntu/keys:/keys -v /home/ubuntu/pkg:/dd-agent-omnibus/pkg -v /home/ubuntu/cache/$DOCKER_IMAGE:/var/cache/omnibus $DOCKER_IMAGE
else
  docker run -e OMNIBUS_SOFTWARE_BRANCH=$OMNIBUS_SOFTWARE_BRANCH -e OMNIBUS_BRANCH=$OMNIBUS_BRANCH -e AGENT_BRANCH=$AGENT_BRANCH -e AGENT_VERSION=$AGENT_VERSION -v /home/ubuntu/pkg:/dd-agent-omnibus/pkg -v /home/ubuntu/cache/$DOCKER_IMAGE:/var/cache/omnibus $DOCKER_IMAGE
fi
