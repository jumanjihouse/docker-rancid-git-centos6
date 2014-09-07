#!/bin/bash
set -e

img="jumanjiman/rancid-git:centos6"
docker run --rm -t -v /tmp/rancid-git-rpms:/tmp/rancid-git-rpms $img find /tmp/tito -regex '.*\.rpm' -exec cp {} /tmp/rancid-git-rpms \;
ls /tmp/rancid-git-rpms/rancid-git*.rpm
