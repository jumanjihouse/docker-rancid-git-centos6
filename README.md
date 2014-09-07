rancid-git on CentOS 6.5
========================

[![wercker status](https://app.wercker.com/status/57224ae02e0259e08c35085410a0098d/s/master "wercker status")](https://app.wercker.com/project/bykey/57224ae02e0259e08c35085410a0098d)

Overview
--------

Demonstrate one way to build `rancid-git` on CentOS.

`sysconftool` is needed to build `rancid-git`,
but EPEL currently does not provide `sysconftool`.

Therefore this demo uses Docker to...

* Download the `sysconftool` SRPM from Fedora 20 and build it for CentOS.
* Build and install `rancid-git` on CentOS.


How-to
------

On a host with Docker:

    git clone https://github.com/jumanjihouse/docker-rancid-git-centos6.git
    cd docker-rancid-git-centos6
    docker build --rm -t rancid-git:centos6 .

Spin up a container:

    docker run -i -t rancid-git:centos6 bash


License
-------

See LICENSE in this repo.


References
----------

* [rancid-git](https://github.com/dotwaffle/rancid-git)
* [sysconftool](https://apps.fedoraproject.org/packages/sysconftool)
