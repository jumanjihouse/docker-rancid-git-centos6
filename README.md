rancid-git on CentOS 7
======================

[![wercker status](https://app.wercker.com/status/57224ae02e0259e08c35085410a0098d/s/master "wercker status")](https://app.wercker.com/project/bykey/57224ae02e0259e08c35085410a0098d)

Overview
--------

Demonstrate one way to build `rancid-git` on CentOS.

`sysconftool` is needed to build `rancid-git`,
but EPEL currently does not provide `sysconftool`.

Therefore this demo uses Docker to...

* Download the `sysconftool` SRPM from Fedora 23 and build it for CentOS.
* Build and install `rancid-git` on CentOS.


How-to
------

This is an automated build on the
[Docker Hub](https://registry.hub.docker.com/u/jumanjiman/rancid-git/).

:warning: The following commands assume your user account has privilege
to run the `docker` command.

Copy the SRPM and RPMs from the container into `/tmp/rancid-git-rpms` on the host:

    git clone https://github.com/jumanjihouse/docker-rancid-git-centos6.git
    cd docker-rancid-git-centos6
    script/copy_rpms.sh

Spin up a container:

    docker pull jumanjiman/rancid-git:centos7
    docker run -i -t jumanjiman/rancid-git:centos7 bash

Create your own Dockerfile based on this one:

    FROM jumanjiman/rancid-git:centos7
    # Do other things in your Dockefile.

Build this image locally on a host with Docker:

    git clone https://github.com/jumanjihouse/docker-rancid-git-centos6.git
    cd docker-rancid-git-centos6
    docker build --rm -t rancid-git:centos7 .


License
-------

See LICENSE in this repo.


References
----------

* [rancid-git](https://github.com/dotwaffle/rancid-git)
* [sysconftool](https://apps.fedoraproject.org/packages/sysconftool)
