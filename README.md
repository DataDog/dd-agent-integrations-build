# dd-agent-integrations-build
Project used with CircleCI to build the Datadog Agent Integrations.

Builds are run in docker containers that use the same images as the Agent builds, i.e.:

* https://github.com/DataDog/docker-dd-agent-build-deb-x64
* https://github.com/DataDog/docker-dd-agent-build-rpm-x64

The main script used by the build is [`build_integration.sh`](https://github.com/DataDog/dd-agent-omnibus/blob/master/build_integration.sh)
from [dd-agent-omnibus](https://github.com/DataDog/dd-agent-omnibus).
