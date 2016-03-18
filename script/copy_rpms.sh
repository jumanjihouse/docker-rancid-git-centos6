#!/bin/bash
set -e

. test/vars.bash

mkdir -p /tmp/rancid-git-rpms || :
docker run --rm -t -v /tmp/rancid-git-rpms:/tmp/rancid-git-rpms ${image} find /tmp/tito -xdev -regex '.*\.rpm' -exec cp {} /tmp/rancid-git-rpms \;
ls /tmp/rancid-git-rpms/rancid-git*.rpm
